# openapi
No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

This Dart package is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: 0.1.0
- Generator version: 7.9.0
- Build package: org.openapitools.codegen.languages.DartClientCodegen

## Requirements

Dart 2.12 or later

## Installation & Usage

### Github
If this Dart package is published to Github, add the following dependency to your pubspec.yaml
```
dependencies:
  openapi:
    git: https://github.com/GIT_USER_ID/GIT_REPO_ID.git
```

### Local
To use the package in your local drive, add the following dependency to your pubspec.yaml
```
dependencies:
  openapi:
    path: /path/to/openapi
```

## Tests

TODO

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

```dart
import 'package:openapi/api.dart';


final api_instance = DefaultApi();

try {
    final result = api_instance.gardensGet();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->gardensGet: $e\n');
}

```

## Documentation for API Endpoints

All URIs are relative to *http://localhost/user-data*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*DefaultApi* | [**gardensGet**](doc//DefaultApi.md#gardensget) | **GET** /gardens | 
*DefaultApi* | [**gardensIdDelete**](doc//DefaultApi.md#gardensiddelete) | **DELETE** /gardens/{id} | 
*DefaultApi* | [**gardensIdDevicesDeviceIdDelete**](doc//DefaultApi.md#gardensiddevicesdeviceiddelete) | **DELETE** /gardens/{id}/devices/{device_id} | 
*DefaultApi* | [**gardensIdDevicesGet**](doc//DefaultApi.md#gardensiddevicesget) | **GET** /gardens/{id}/devices | 
*DefaultApi* | [**gardensIdDevicesPatch**](doc//DefaultApi.md#gardensiddevicespatch) | **PATCH** /gardens/{id}/devices | 
*DefaultApi* | [**gardensIdGet**](doc//DefaultApi.md#gardensidget) | **GET** /gardens/{id} | 
*DefaultApi* | [**gardensIdPlantsGet**](doc//DefaultApi.md#gardensidplantsget) | **GET** /gardens/{id}/plants | 
*DefaultApi* | [**gardensIdPlantsPost**](doc//DefaultApi.md#gardensidplantspost) | **POST** /gardens/{id}/plants | 
*DefaultApi* | [**gardensIdPut**](doc//DefaultApi.md#gardensidput) | **PUT** /gardens/{id} | 
*DefaultApi* | [**gardensPost**](doc//DefaultApi.md#gardenspost) | **POST** /gardens | 
*DefaultApi* | [**plantsIdDelete**](doc//DefaultApi.md#plantsiddelete) | **DELETE** /plants/{id} | 
*DefaultApi* | [**plantsIdGet**](doc//DefaultApi.md#plantsidget) | **GET** /plants/{id} | 
*DefaultApi* | [**plantsIdPut**](doc//DefaultApi.md#plantsidput) | **PUT** /plants/{id} | 


## Documentation For Models

 - [Garden](doc//Garden.md)
 - [GardenCreate](doc//GardenCreate.md)
 - [Plant](doc//Plant.md)
 - [PlantCreate](doc//PlantCreate.md)


## Documentation For Authorization

Endpoints do not require authorization.


## Author



