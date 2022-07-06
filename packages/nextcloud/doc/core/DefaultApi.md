# openapi.api.DefaultApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAvatar**](DefaultApi.md#getavatar) | **GET** /avatar/{userId}/{size} | 
[**getCapabilities**](DefaultApi.md#getcapabilities) | **GET** /ocs/v1.php/cloud/capabilities | 
[**getLoginFlowResult**](DefaultApi.md#getloginflowresult) | **POST** /login/v2/poll | 
[**getNavigationApps**](DefaultApi.md#getnavigationapps) | **GET** /ocs/v1.php/core/navigation/apps | 
[**getPreview**](DefaultApi.md#getpreview) | **GET** /core/preview.png | 
[**getStatus**](DefaultApi.md#getstatus) | **GET** /status.php | 
[**initLoginFlow**](DefaultApi.md#initloginflow) | **POST** /login/v2 | 


# **getAvatar**
> String getAvatar(userId, size)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final userId = userId_example; // String | 
final size = 56; // int | 

try {
    final result = api_instance.getAvatar(userId, size);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getAvatar: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 
 **size** | **int**|  | 

### Return type

**String**

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCapabilities**
> CoreServerCapabilities getCapabilities()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();

try {
    final result = api_instance.getCapabilities();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getCapabilities: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**CoreServerCapabilities**](CoreServerCapabilities.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLoginFlowResult**
> CoreLoginFlowResult getLoginFlowResult(coreLoginFlowQuery)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final coreLoginFlowQuery = CoreLoginFlowQuery(); // CoreLoginFlowQuery | 

try {
    final result = api_instance.getLoginFlowResult(coreLoginFlowQuery);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getLoginFlowResult: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **coreLoginFlowQuery** | [**CoreLoginFlowQuery**](CoreLoginFlowQuery.md)|  | 

### Return type

[**CoreLoginFlowResult**](CoreLoginFlowResult.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getNavigationApps**
> CoreNavigationApps getNavigationApps()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();

try {
    final result = api_instance.getNavigationApps();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getNavigationApps: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**CoreNavigationApps**](CoreNavigationApps.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPreview**
> String getPreview(file, x, y, mode, forceIcon, a)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final file = file_example; // String | 
final x = 56; // int | 
final y = 56; // int | 
final mode = mode_example; // String | 
final forceIcon = true; // bool | 
final a = true; // bool | 

try {
    final result = api_instance.getPreview(file, x, y, mode, forceIcon, a);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getPreview: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **String**|  | [optional] 
 **x** | **int**|  | [optional] 
 **y** | **int**|  | [optional] 
 **mode** | **String**|  | [optional] 
 **forceIcon** | **bool**|  | [optional] 
 **a** | **bool**|  | [optional] 

### Return type

**String**

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/png

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStatus**
> CoreServerStatus getStatus()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();

try {
    final result = api_instance.getStatus();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getStatus: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**CoreServerStatus**](CoreServerStatus.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **initLoginFlow**
> CoreLoginFlowInit initLoginFlow()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();

try {
    final result = api_instance.initLoginFlow();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->initLoginFlow: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**CoreLoginFlowInit**](CoreLoginFlowInit.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

