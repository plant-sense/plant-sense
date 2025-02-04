from multiprocessing.pool import ThreadPool
import requests
import json
import os
from urllib.parse import quote
import csv
from multiprocessing import Pool, cpu_count
import pandas as pd
from typing import Dict, Optional, Tuple
from tqdm import tqdm
import re

headers = {'User-Agent': 'PlantSenseBot'}

def get_plant_image_data(scientific_name: str) -> Tuple[str, Optional[Dict]]:
    """
    Gets image metadata for a plant from Wikimedia Commons.
    
    Args:
        scientific_name (str): Scientific name of the plant
    
    Returns:
        Tuple[str, Optional[Dict]]: Tuple containing scientific name and metadata dict (or None if no image found)
    """
    # Construct the API query
    search_term = f'"{scientific_name}"'
    api_url = 'https://commons.wikimedia.org/w/api.php'
    
    # Acceptable licenses
    ALLOWED_LICENSES = {'CC0', 'PD'}
    
    try:
        # First, search for images with the given scientific name
        search_params = {
            'action': 'query',
            'format': 'json',
            'list': 'search',
            'srsearch': f'{search_term} filetype:bitmap',
            'srnamespace': 6,  # File namespace
            'srlimit': 50,
            'srwhat': 'text'
        }
        
        response = requests.get(api_url, params=search_params, headers=headers)
        response.raise_for_status()
        search_data = response.json()
        
        # Process search results
        for result in search_data['query']['search']:
            title = result['title']
            
            # Get image info and metadata
            info_params = {
                'action': 'query',
                'format': 'json',
                'prop': 'imageinfo|categories',
                'iiprop': 'url|extmetadata',
                'titles': title
            }
            
            info_response = requests.get(api_url, params=info_params, headers=headers)
            info_response.raise_for_status()
            info_data = info_response.json()
            
            # Get the first page (should be only one)
            pages = info_data['query']['pages']
            page_id = list(pages.keys())[0]
            page = pages[page_id]
            
            if 'imageinfo' not in page:
                continue
                
            image_info = page['imageinfo'][0]
            metadata = image_info.get('extmetadata', {})
            
            # Check license
            license_name = metadata.get('License', {}).get('value', '').upper()
            
            # Skip if license doesn't match exactly what we want
            if not any(lic in license_name for lic in ALLOWED_LICENSES):
                continue
                
            # Skip if it's CC-BY-SA
            if 'CC-BY-SA' in license_name or 'CC BY-SA' in license_name:
                continue
            
            
            image_page_url = f"https://commons.wikimedia.org/wiki/{quote(title)}"
            
            return scientific_name, {
                'license': license_name,
                'author': '', # not needed for CC-0 or PD
                'image_url': image_info['url'],
                'wikimedia_page': image_page_url
            }
            
        return scientific_name, None
        
    except requests.exceptions.RequestException as e:
        print(f"Error processing {scientific_name}: {e}")
        return scientific_name, None

def process_plant_list(input_file: str, output_file: str):
    # Read input CSV
    try:
        df = pd.read_csv(input_file, sep=';')
        plant_names = df['Plant name'].tolist()
    except Exception as e:
        print(f"Error reading input file: {e}")
        return

    num_processes = cpu_count()
    with ThreadPool(processes=num_processes) as pool:
        results = list(tqdm(
            pool.imap(get_plant_image_data, plant_names),
            total=len(plant_names),
            desc="Processing plants",
            unit="plant"
        ))
    
    # Prepare output data
    output_data = []
    for scientific_name, metadata in results:
        if metadata is None:
            output_data.append({
                'scientific_name': scientific_name,
                'license': None,
                'author': None,
                'image_url': None,
                'wikimedia_page': None
            })
        else:
            output_data.append({
                'scientific_name': scientific_name,
                'license': metadata['license'],
                'author': metadata['author'],
                'image_url': metadata['image_url'],
                'wikimedia_page': metadata['wikimedia_page']
            })
    
    # Write to CSV
    try:
        pd.DataFrame(output_data).to_csv(output_file, index=False)
        print(f"Results written to {output_file}")
    except Exception as e:
        print(f"Error writing output file: {e}")

if __name__ == "__main__":
    input_file = "watchflower_plantdb.csv"
    output_file = "plant_images_metadata.csv"
    process_plant_list(input_file, output_file)