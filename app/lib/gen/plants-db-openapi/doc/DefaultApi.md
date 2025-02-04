# openapi.api.DefaultApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/species-db*

Method | HTTP request | Description
------------- | ------------- | -------------
[**searchPost**](DefaultApi.md#searchpost) | **POST** /search | 
[**speciesGet**](DefaultApi.md#speciesget) | **GET** /species | 
[**speciesIdGet**](DefaultApi.md#speciesidget) | **GET** /species/{id} | 
[**speciesIdRequirementsGet**](DefaultApi.md#speciesidrequirementsget) | **GET** /species/{id}/requirements | 
[**speciesIdTaxonomyGet**](DefaultApi.md#speciesidtaxonomyget) | **GET** /species/{id}/taxonomy | 


# **searchPost**
> List<Plant> searchPost(searchRequest)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final searchRequest = SearchRequest(); // SearchRequest | 

try {
    final result = api_instance.searchPost(searchRequest);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->searchPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **searchRequest** | [**SearchRequest**](SearchRequest.md)|  | [optional] 

### Return type

[**List<Plant>**](Plant.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **speciesGet**
> List<Plant> speciesGet()



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();

try {
    final result = api_instance.speciesGet();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->speciesGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<Plant>**](Plant.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **speciesIdGet**
> Factsheet speciesIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | plant ID

try {
    final result = api_instance.speciesIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->speciesIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| plant ID | 

### Return type

[**Factsheet**](Factsheet.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **speciesIdRequirementsGet**
> Requirements speciesIdRequirementsGet(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final result = api_instance.speciesIdRequirementsGet(id);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->speciesIdRequirementsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**Requirements**](Requirements.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **speciesIdTaxonomyGet**
> Taxonomy speciesIdTaxonomyGet(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final result = api_instance.speciesIdTaxonomyGet(id);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->speciesIdTaxonomyGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**Taxonomy**](Taxonomy.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

