# openapi.api.DefaultApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/plants-db*

Method | HTTP request | Description
------------- | ------------- | -------------
[**plantsGet**](DefaultApi.md#plantsget) | **GET** /plants | 
[**plantsIdDelete**](DefaultApi.md#plantsiddelete) | **DELETE** /plants/{id} | 
[**plantsIdGet**](DefaultApi.md#plantsidget) | **GET** /plants/{id} | 
[**plantsIdPut**](DefaultApi.md#plantsidput) | **PUT** /plants/{id} | 
[**plantsIdRequirementsGet**](DefaultApi.md#plantsidrequirementsget) | **GET** /plants/{id}/requirements | 
[**plantsIdTaxonomyGet**](DefaultApi.md#plantsidtaxonomyget) | **GET** /plants/{id}/taxonomy | 
[**plantsPost**](DefaultApi.md#plantspost) | **POST** /plants | 
[**searchPost**](DefaultApi.md#searchpost) | **POST** /search | 


# **plantsGet**
> List<Plant> plantsGet()



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();

try {
    final result = api_instance.plantsGet();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->plantsGet: $e\n');
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

# **plantsIdDelete**
> Factsheet plantsIdDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | plant ID

try {
    final result = api_instance.plantsIdDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->plantsIdDelete: $e\n');
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

# **plantsIdGet**
> Factsheet plantsIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | plant ID

try {
    final result = api_instance.plantsIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->plantsIdGet: $e\n');
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

# **plantsIdPut**
> Plant plantsIdPut(id, plant)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | plant ID
final plant = Plant(); // Plant | 

try {
    final result = api_instance.plantsIdPut(id, plant);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->plantsIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| plant ID | 
 **plant** | [**Plant**](Plant.md)|  | [optional] 

### Return type

[**Plant**](Plant.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **plantsIdRequirementsGet**
> Requirements plantsIdRequirementsGet(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final result = api_instance.plantsIdRequirementsGet(id);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->plantsIdRequirementsGet: $e\n');
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

# **plantsIdTaxonomyGet**
> Taxonomy plantsIdTaxonomyGet(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 

try {
    final result = api_instance.plantsIdTaxonomyGet(id);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->plantsIdTaxonomyGet: $e\n');
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

# **plantsPost**
> Plant plantsPost(plant)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final plant = Plant(); // Plant | 

try {
    final result = api_instance.plantsPost(plant);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->plantsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **plant** | [**Plant**](Plant.md)|  | [optional] 

### Return type

[**Plant**](Plant.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

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

