# openapi.api.DefaultApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost:8080/ocs/v1.php/apps/notifications*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteAllNotifications**](DefaultApi.md#deleteallnotifications) | **DELETE** /api/v2/notifications | 
[**deleteNotification**](DefaultApi.md#deletenotification) | **DELETE** /api/v2/notifications/{id} | 
[**getNotification**](DefaultApi.md#getnotification) | **GET** /api/v2/notifications/{id} | 
[**listNotifications**](DefaultApi.md#listnotifications) | **GET** /api/v2/notifications | 
[**registerDevice**](DefaultApi.md#registerdevice) | **POST** /api/v2/push | 
[**removeDevice**](DefaultApi.md#removedevice) | **DELETE** /api/v2/push | 
[**sendAdminNotification**](DefaultApi.md#sendadminnotification) | **POST** /api/v2/admin_notifications/{userId} | 


# **deleteAllNotifications**
> String deleteAllNotifications()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();

try {
    final result = api_instance.deleteAllNotifications();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->deleteAllNotifications: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**String**

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteNotification**
> NotificationsEmpty deleteNotification(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final id = 56; // int | 

try {
    final result = api_instance.deleteNotification(id);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->deleteNotification: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**NotificationsEmpty**](NotificationsEmpty.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getNotification**
> NotificationsGetNotification getNotification(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final id = 56; // int | 

try {
    final result = api_instance.getNotification(id);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getNotification: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**NotificationsGetNotification**](NotificationsGetNotification.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listNotifications**
> NotificationsListNotifications listNotifications()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();

try {
    final result = api_instance.listNotifications();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->listNotifications: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**NotificationsListNotifications**](NotificationsListNotifications.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **registerDevice**
> NotificationsPushServerRegistration registerDevice(pushTokenHash, devicePublicKey, proxyServer)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final pushTokenHash = pushTokenHash_example; // String | 
final devicePublicKey = devicePublicKey_example; // String | 
final proxyServer = proxyServer_example; // String | 

try {
    final result = api_instance.registerDevice(pushTokenHash, devicePublicKey, proxyServer);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->registerDevice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pushTokenHash** | **String**|  | 
 **devicePublicKey** | **String**|  | 
 **proxyServer** | **String**|  | 

### Return type

[**NotificationsPushServerRegistration**](NotificationsPushServerRegistration.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeDevice**
> String removeDevice()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();

try {
    final result = api_instance.removeDevice();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->removeDevice: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**String**

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sendAdminNotification**
> NotificationsEmpty sendAdminNotification(userId, shortMessage, longMessage)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final userId = userId_example; // String | 
final shortMessage = shortMessage_example; // String | 
final longMessage = longMessage_example; // String | 

try {
    final result = api_instance.sendAdminNotification(userId, shortMessage, longMessage);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->sendAdminNotification: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 
 **shortMessage** | **String**|  | 
 **longMessage** | **String**|  | [optional] [default to '']

### Return type

[**NotificationsEmpty**](NotificationsEmpty.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

