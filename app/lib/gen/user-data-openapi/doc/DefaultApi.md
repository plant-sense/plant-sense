# openapi.api.DefaultApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost/user-data*

Method | HTTP request | Description
------------- | ------------- | -------------
[**gardensGet**](DefaultApi.md#gardensget) | **GET** /gardens | 
[**gardensIdDelete**](DefaultApi.md#gardensiddelete) | **DELETE** /gardens/{id} | 
[**gardensIdDevicesDeviceIdDelete**](DefaultApi.md#gardensiddevicesdeviceiddelete) | **DELETE** /gardens/{id}/devices/{device_id} | 
[**gardensIdDevicesGet**](DefaultApi.md#gardensiddevicesget) | **GET** /gardens/{id}/devices | 
[**gardensIdDevicesPatch**](DefaultApi.md#gardensiddevicespatch) | **PATCH** /gardens/{id}/devices | 
[**gardensIdGet**](DefaultApi.md#gardensidget) | **GET** /gardens/{id} | 
[**gardensIdPlantsGet**](DefaultApi.md#gardensidplantsget) | **GET** /gardens/{id}/plants | 
[**gardensIdPlantsPost**](DefaultApi.md#gardensidplantspost) | **POST** /gardens/{id}/plants | 
[**gardensIdPut**](DefaultApi.md#gardensidput) | **PUT** /gardens/{id} | 
[**gardensPost**](DefaultApi.md#gardenspost) | **POST** /gardens | 
[**plantsIdDelete**](DefaultApi.md#plantsiddelete) | **DELETE** /plants/{id} | 
[**plantsIdGet**](DefaultApi.md#plantsidget) | **GET** /plants/{id} | 
[**plantsIdPut**](DefaultApi.md#plantsidput) | **PUT** /plants/{id} | 


# **gardensGet**
> List<Garden> gardensGet()



### Example
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

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<Garden>**](Garden.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gardensIdDelete**
> gardensIdDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Garden ID

try {
    api_instance.gardensIdDelete(id);
} catch (e) {
    print('Exception when calling DefaultApi->gardensIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Garden ID | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gardensIdDevicesDeviceIdDelete**
> gardensIdDevicesDeviceIdDelete(id, deviceId)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Garden ID
final deviceId = deviceId_example; // String | Device ID

try {
    api_instance.gardensIdDevicesDeviceIdDelete(id, deviceId);
} catch (e) {
    print('Exception when calling DefaultApi->gardensIdDevicesDeviceIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Garden ID | 
 **deviceId** | **String**| Device ID | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gardensIdDevicesGet**
> Map<String, String> gardensIdDevicesGet(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Garden ID

try {
    final result = api_instance.gardensIdDevicesGet(id);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->gardensIdDevicesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Garden ID | 

### Return type

**Map<String, String>**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gardensIdDevicesPatch**
> Map<String, String> gardensIdDevicesPatch(id, requestBody)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Garden ID
final requestBody = Map<String, String>(); // Map<String, String> | 

try {
    final result = api_instance.gardensIdDevicesPatch(id, requestBody);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->gardensIdDevicesPatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Garden ID | 
 **requestBody** | [**Map<String, String>**](String.md)|  | [optional] 

### Return type

**Map<String, String>**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gardensIdGet**
> Garden gardensIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Garden ID

try {
    final result = api_instance.gardensIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->gardensIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Garden ID | 

### Return type

[**Garden**](Garden.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gardensIdPlantsGet**
> List<Plant> gardensIdPlantsGet(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Garden ID

try {
    final result = api_instance.gardensIdPlantsGet(id);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->gardensIdPlantsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Garden ID | 

### Return type

[**List<Plant>**](Plant.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gardensIdPlantsPost**
> List<Plant> gardensIdPlantsPost(id, plantCreate)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Garden ID
final plantCreate = PlantCreate(); // PlantCreate | 

try {
    final result = api_instance.gardensIdPlantsPost(id, plantCreate);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->gardensIdPlantsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Garden ID | 
 **plantCreate** | [**PlantCreate**](PlantCreate.md)|  | [optional] 

### Return type

[**List<Plant>**](Plant.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gardensIdPut**
> Garden gardensIdPut(id, gardenCreate)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Garden ID
final gardenCreate = GardenCreate(); // GardenCreate | 

try {
    final result = api_instance.gardensIdPut(id, gardenCreate);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->gardensIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Garden ID | 
 **gardenCreate** | [**GardenCreate**](GardenCreate.md)|  | [optional] 

### Return type

[**Garden**](Garden.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gardensPost**
> Garden gardensPost(gardenCreate)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final gardenCreate = GardenCreate(); // GardenCreate | 

try {
    final result = api_instance.gardensPost(gardenCreate);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->gardensPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **gardenCreate** | [**GardenCreate**](GardenCreate.md)|  | [optional] 

### Return type

[**Garden**](Garden.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **plantsIdDelete**
> plantsIdDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Plant ID

try {
    api_instance.plantsIdDelete(id);
} catch (e) {
    print('Exception when calling DefaultApi->plantsIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Plant ID | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **plantsIdGet**
> Plant plantsIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Plant ID

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
 **id** | **String**| Plant ID | 

### Return type

[**Plant**](Plant.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **plantsIdPut**
> Plant plantsIdPut(id, plantCreate)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Plant ID
final plantCreate = PlantCreate(); // PlantCreate | 

try {
    final result = api_instance.plantsIdPut(id, plantCreate);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->plantsIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Plant ID | 
 **plantCreate** | [**PlantCreate**](PlantCreate.md)|  | [optional] 

### Return type

[**Plant**](Plant.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

