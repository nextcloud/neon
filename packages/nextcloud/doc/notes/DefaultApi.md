# openapi.api.DefaultApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost:8080/apps/notes*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createNote**](DefaultApi.md#createnote) | **POST** /api/v1/notes | 
[**deleteNote**](DefaultApi.md#deletenote) | **DELETE** /api/v1/notes/{id} | 
[**getNote**](DefaultApi.md#getnote) | **GET** /api/v1/notes/{id} | 
[**getNotes**](DefaultApi.md#getnotes) | **GET** /api/v1/notes | 
[**getSettings**](DefaultApi.md#getsettings) | **GET** /api/v1/settings | 
[**updateNote**](DefaultApi.md#updatenote) | **PUT** /api/v1/notes/{id} | 
[**updateSettings**](DefaultApi.md#updatesettings) | **PUT** /api/v1/settings | 


# **createNote**
> NotesNote createNote(category, title, content, modified, favorite)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final category = category_example; // String | 
final title = title_example; // String | 
final content = content_example; // String | 
final modified = 56; // int | 
final favorite = true; // bool | 

try {
    final result = api_instance.createNote(category, title, content, modified, favorite);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->createNote: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **category** | **String**|  | [optional] [default to '']
 **title** | **String**|  | [optional] [default to '']
 **content** | **String**|  | [optional] [default to '']
 **modified** | **int**|  | [optional] [default to 0]
 **favorite** | **bool**|  | [optional] [default to false]

### Return type

[**NotesNote**](NotesNote.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteNote**
> String deleteNote(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final id = 56; // int | 

try {
    final result = api_instance.deleteNote(id);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->deleteNote: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**String**

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getNote**
> NotesNote getNote(id, exclude, ifNoneMatch)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final id = 56; // int | 
final exclude = exclude_example; // String | 
final ifNoneMatch = ifNoneMatch_example; // String | 

try {
    final result = api_instance.getNote(id, exclude, ifNoneMatch);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getNote: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **exclude** | **String**|  | [optional] [default to '']
 **ifNoneMatch** | **String**|  | [optional] 

### Return type

[**NotesNote**](NotesNote.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getNotes**
> List<NotesNote> getNotes(category, exclude, pruneBefore, chunkSize, chunkCursor, ifNoneMatch)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final category = category_example; // String | 
final exclude = exclude_example; // String | 
final pruneBefore = 56; // int | 
final chunkSize = 56; // int | 
final chunkCursor = chunkCursor_example; // String | 
final ifNoneMatch = ifNoneMatch_example; // String | 

try {
    final result = api_instance.getNotes(category, exclude, pruneBefore, chunkSize, chunkCursor, ifNoneMatch);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getNotes: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **category** | **String**|  | [optional] 
 **exclude** | **String**|  | [optional] [default to '']
 **pruneBefore** | **int**|  | [optional] [default to 0]
 **chunkSize** | **int**|  | [optional] [default to 0]
 **chunkCursor** | **String**|  | [optional] 
 **ifNoneMatch** | **String**|  | [optional] 

### Return type

[**List<NotesNote>**](NotesNote.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSettings**
> NotesSettings getSettings()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();

try {
    final result = api_instance.getSettings();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getSettings: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**NotesSettings**](NotesSettings.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateNote**
> NotesNote updateNote(id, content, modified, title, category, favorite, ifMatch)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final id = 56; // int | 
final content = content_example; // String | 
final modified = 56; // int | 
final title = title_example; // String | 
final category = category_example; // String | 
final favorite = true; // bool | 
final ifMatch = ifMatch_example; // String | 

try {
    final result = api_instance.updateNote(id, content, modified, title, category, favorite, ifMatch);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->updateNote: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **content** | **String**|  | [optional] 
 **modified** | **int**|  | [optional] 
 **title** | **String**|  | [optional] 
 **category** | **String**|  | [optional] 
 **favorite** | **bool**|  | [optional] 
 **ifMatch** | **String**|  | [optional] 

### Return type

[**NotesNote**](NotesNote.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateSettings**
> NotesSettings updateSettings(notesSettings)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final notesSettings = NotesSettings(); // NotesSettings | 

try {
    final result = api_instance.updateSettings(notesSettings);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->updateSettings: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **notesSettings** | [**NotesSettings**](NotesSettings.md)|  | 

### Return type

[**NotesSettings**](NotesSettings.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

