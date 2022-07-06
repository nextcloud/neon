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
> heartbeat(userStatusHeartbeat)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final userStatusHeartbeat = UserStatusHeartbeat(); // UserStatusHeartbeat | 

try {
    api_instance.heartbeat(userStatusHeartbeat);
} catch (e) {
    print('Exception when calling DefaultApi->heartbeat: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userStatusHeartbeat** | [**UserStatusHeartbeat**](UserStatusHeartbeat.md)|  | 

### Return type

void (empty response body)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setCustomMessage**
> UserStatusGetUserStatus setCustomMessage(userStatusSetCustomMessage)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final userStatusSetCustomMessage = UserStatusSetCustomMessage(); // UserStatusSetCustomMessage | 

try {
    final result = api_instance.setCustomMessage(userStatusSetCustomMessage);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->setCustomMessage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userStatusSetCustomMessage** | [**UserStatusSetCustomMessage**](UserStatusSetCustomMessage.md)|  | 

### Return type

[**UserStatusGetUserStatus**](UserStatusGetUserStatus.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setPredefinedMessage**
> UserStatusGetUserStatus setPredefinedMessage(userStatusSetPredefinedMessage)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final userStatusSetPredefinedMessage = UserStatusSetPredefinedMessage(); // UserStatusSetPredefinedMessage | 

try {
    final result = api_instance.setPredefinedMessage(userStatusSetPredefinedMessage);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->setPredefinedMessage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userStatusSetPredefinedMessage** | [**UserStatusSetPredefinedMessage**](UserStatusSetPredefinedMessage.md)|  | 

### Return type

[**UserStatusGetUserStatus**](UserStatusGetUserStatus.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setStatus**
> UserStatusGetUserStatus setStatus(userStatusSetUserStatus)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final userStatusSetUserStatus = UserStatusSetUserStatus(); // UserStatusSetUserStatus | 

try {
    final result = api_instance.setStatus(userStatusSetUserStatus);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->setStatus: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userStatusSetUserStatus** | [**UserStatusSetUserStatus**](UserStatusSetUserStatus.md)|  | 

### Return type

[**UserStatusGetUserStatus**](UserStatusGetUserStatus.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

