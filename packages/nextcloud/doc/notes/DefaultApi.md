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
> NotesNote createNote(notesNote)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final notesNote = NotesNote(); // NotesNote | 

try {
    final result = api_instance.createNote(notesNote);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->createNote: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **notesNote** | [**NotesNote**](NotesNote.md)|  | 

### Return type

[**NotesNote**](NotesNote.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteNote**
> String deleteNote(id, ifNoneMatch)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final id = 56; // int | 
final ifNoneMatch = ifNoneMatch_example; // String | 

try {
    final result = api_instance.deleteNote(id, ifNoneMatch);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->deleteNote: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **ifNoneMatch** | **String**|  | [optional] 

### Return type

**String**

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getNote**
> NotesNote getNote(id, ifNoneMatch)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final id = 56; // int | 
final ifNoneMatch = ifNoneMatch_example; // String | 

try {
    final result = api_instance.getNote(id, ifNoneMatch);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getNote: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
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
> List<NotesNote> getNotes(category, exclude, pruneBefore, ifNoneMatch)



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
final ifNoneMatch = ifNoneMatch_example; // String | 

try {
    final result = api_instance.getNotes(category, exclude, pruneBefore, ifNoneMatch);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getNotes: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **category** | **String**|  | [optional] 
 **exclude** | **String**|  | [optional] 
 **pruneBefore** | **int**|  | [optional] 
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
> NotesNote updateNote(id, notesNote, ifNoneMatch, ifMatch)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final id = 56; // int | 
final notesNote = NotesNote(); // NotesNote | 
final ifNoneMatch = ifNoneMatch_example; // String | 
final ifMatch = ifMatch_example; // String | 

try {
    final result = api_instance.updateNote(id, notesNote, ifNoneMatch, ifMatch);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->updateNote: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **notesNote** | [**NotesNote**](NotesNote.md)|  | 
 **ifNoneMatch** | **String**|  | [optional] 
 **ifMatch** | **String**|  | [optional] 

### Return type

[**NotesNote**](NotesNote.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: application/json
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

