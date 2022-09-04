# openapi.api.DefaultApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost:8080/ocs/v1.php/apps/user_status*

Method | HTTP request | Description
------------- | ------------- | -------------
[**clearMessage**](DefaultApi.md#clearmessage) | **DELETE** /api/v1/user_status/message | 
[**findAllPredefinedStatuses**](DefaultApi.md#findallpredefinedstatuses) | **GET** /api/v1/predefined_statuses | 
[**findAllStatuses**](DefaultApi.md#findallstatuses) | **GET** /api/v1/statuses | 
[**findStatus**](DefaultApi.md#findstatus) | **GET** /api/v1/statuses/{userId} | 
[**getStatus**](DefaultApi.md#getstatus) | **GET** /api/v1/user_status | 
[**heartbeat**](DefaultApi.md#heartbeat) | **PUT** /api/v1/heartbeat | 
[**setCustomMessage**](DefaultApi.md#setcustommessage) | **PUT** /api/v1/user_status/message/custom | 
[**setPredefinedMessage**](DefaultApi.md#setpredefinedmessage) | **PUT** /api/v1/user_status/message/predefined | 
[**setStatus**](DefaultApi.md#setstatus) | **PUT** /api/v1/user_status/status | 


# **clearMessage**
> clearMessage()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();

try {
    api_instance.clearMessage();
} catch (e) {
    print('Exception when calling DefaultApi->clearMessage: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findAllPredefinedStatuses**
> UserStatusPredefinedStatuses findAllPredefinedStatuses()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();

try {
    final result = api_instance.findAllPredefinedStatuses();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->findAllPredefinedStatuses: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**UserStatusPredefinedStatuses**](UserStatusPredefinedStatuses.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findAllStatuses**
> UserStatusFindAllStatuses findAllStatuses()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();

try {
    final result = api_instance.findAllStatuses();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->findAllStatuses: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**UserStatusFindAllStatuses**](UserStatusFindAllStatuses.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findStatus**
> UserStatusFindStatus findStatus(userId)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final userId = userId_example; // String | 

try {
    final result = api_instance.findStatus(userId);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->findStatus: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 

### Return type

[**UserStatusFindStatus**](UserStatusFindStatus.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStatus**
> UserStatusGetUserStatus getStatus()



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

[**UserStatusGetUserStatus**](UserStatusGetUserStatus.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **heartbeat**
> heartbeat(status)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final status = ; // UserStatusTypeEnum | 

try {
    api_instance.heartbeat(status);
} catch (e) {
    print('Exception when calling DefaultApi->heartbeat: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **status** | [**UserStatusTypeEnum**](.md)|  | 

### Return type

void (empty response body)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setCustomMessage**
> UserStatusGetUserStatus setCustomMessage(statusIcon, message, clearAt)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final statusIcon = statusIcon_example; // String | 
final message = message_example; // String | 
final clearAt = 56; // int | 

try {
    final result = api_instance.setCustomMessage(statusIcon, message, clearAt);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->setCustomMessage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **statusIcon** | **String**|  | [optional] 
 **message** | **String**|  | [optional] 
 **clearAt** | **int**|  | [optional] 

### Return type

[**UserStatusGetUserStatus**](UserStatusGetUserStatus.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setPredefinedMessage**
> UserStatusGetUserStatus setPredefinedMessage(messageId, clearAt)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final messageId = messageId_example; // String | 
final clearAt = 56; // int | 

try {
    final result = api_instance.setPredefinedMessage(messageId, clearAt);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->setPredefinedMessage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **messageId** | **String**|  | 
 **clearAt** | **int**|  | [optional] 

### Return type

[**UserStatusGetUserStatus**](UserStatusGetUserStatus.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setStatus**
> UserStatusGetUserStatus setStatus(statusType)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final statusType = ; // UserStatusTypeEnum | 

try {
    final result = api_instance.setStatus(statusType);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->setStatus: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **statusType** | [**UserStatusTypeEnum**](.md)|  | 

### Return type

[**UserStatusGetUserStatus**](UserStatusGetUserStatus.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

