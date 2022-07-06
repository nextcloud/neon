# openapi.api.DefaultApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost:8080/apps/news*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addFeed**](DefaultApi.md#addfeed) | **POST** /api/v1-2/feeds | 
[**createFolder**](DefaultApi.md#createfolder) | **POST** /api/v1-2/folders | 
[**deleteFeed**](DefaultApi.md#deletefeed) | **DELETE** /api/v1-2/feeds/{feedId} | 
[**deleteFolder**](DefaultApi.md#deletefolder) | **DELETE** /api/v1-2/folders/{folderId} | 
[**listArticles**](DefaultApi.md#listarticles) | **GET** /api/v1-2/items | 
[**listFeeds**](DefaultApi.md#listfeeds) | **GET** /api/v1-2/feeds | 
[**listFolders**](DefaultApi.md#listfolders) | **GET** /api/v1-2/folders | 
[**listUpdatedArticles**](DefaultApi.md#listupdatedarticles) | **GET** /api/v1-2/items/updated | 
[**markArticleAsRead**](DefaultApi.md#markarticleasread) | **PUT** /api/v1-2/items/{itemId}/read | 
[**markArticleAsUnread**](DefaultApi.md#markarticleasunread) | **PUT** /api/v1-2/items/{itemId}/unread | 
[**markFeedAsRead**](DefaultApi.md#markfeedasread) | **PUT** /api/v1-2/feeds/{feedId}/read | 
[**markFolderAsRead**](DefaultApi.md#markfolderasread) | **PUT** /api/v1-2/folders/{folderId}/read | 
[**moveFeed**](DefaultApi.md#movefeed) | **PUT** /api/v1-2/feeds/{feedId}/move | 
[**renameFeed**](DefaultApi.md#renamefeed) | **PUT** /api/v1-2/feeds/{feedId}/rename | 
[**renameFolder**](DefaultApi.md#renamefolder) | **PUT** /api/v1-2/folders/{folderId} | 
[**starArticle**](DefaultApi.md#stararticle) | **PUT** /api/v1-2/items/{feedId}/{guidHash}/star | 
[**unstarArticle**](DefaultApi.md#unstararticle) | **PUT** /api/v1-2/items/{feedId}/{guidHash}/unstar | 


# **addFeed**
> NewsListFeeds addFeed(newsAddFeed)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final newsAddFeed = NewsAddFeed(); // NewsAddFeed | 

try {
    final result = api_instance.addFeed(newsAddFeed);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->addFeed: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **newsAddFeed** | [**NewsAddFeed**](NewsAddFeed.md)|  | 

### Return type

[**NewsListFeeds**](NewsListFeeds.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createFolder**
> NewsListFolders createFolder(newsCreateFolder)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final newsCreateFolder = NewsCreateFolder(); // NewsCreateFolder | 

try {
    final result = api_instance.createFolder(newsCreateFolder);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->createFolder: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **newsCreateFolder** | [**NewsCreateFolder**](NewsCreateFolder.md)|  | 

### Return type

[**NewsListFolders**](NewsListFolders.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteFeed**
> deleteFeed(feedId)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final feedId = 56; // int | 

try {
    api_instance.deleteFeed(feedId);
} catch (e) {
    print('Exception when calling DefaultApi->deleteFeed: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **feedId** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteFolder**
> deleteFolder(folderId)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final folderId = 56; // int | 

try {
    api_instance.deleteFolder(folderId);
} catch (e) {
    print('Exception when calling DefaultApi->deleteFolder: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **folderId** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listArticles**
> NewsListArticles listArticles(type, id, getRead, batchSize, offset, oldestFirst)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final type = 56; // int | 
final id = 56; // int | 
final getRead = true; // bool | 
final batchSize = 56; // int | 
final offset = 56; // int | 
final oldestFirst = true; // bool | 

try {
    final result = api_instance.listArticles(type, id, getRead, batchSize, offset, oldestFirst);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->listArticles: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **int**|  | [optional] 
 **id** | **int**|  | [optional] 
 **getRead** | **bool**|  | [optional] 
 **batchSize** | **int**|  | [optional] 
 **offset** | **int**|  | [optional] 
 **oldestFirst** | **bool**|  | [optional] 

### Return type

[**NewsListArticles**](NewsListArticles.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listFeeds**
> NewsListFeeds listFeeds()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();

try {
    final result = api_instance.listFeeds();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->listFeeds: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**NewsListFeeds**](NewsListFeeds.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listFolders**
> NewsListFolders listFolders()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();

try {
    final result = api_instance.listFolders();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->listFolders: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**NewsListFolders**](NewsListFolders.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listUpdatedArticles**
> NewsListArticles listUpdatedArticles(lastModified, type, id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final lastModified = 56; // int | 
final type = 56; // int | 
final id = 56; // int | 

try {
    final result = api_instance.listUpdatedArticles(lastModified, type, id);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->listUpdatedArticles: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lastModified** | **int**|  | [optional] 
 **type** | **int**|  | [optional] 
 **id** | **int**|  | [optional] 

### Return type

[**NewsListArticles**](NewsListArticles.md)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **markArticleAsRead**
> markArticleAsRead(itemId)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final itemId = 56; // int | 

try {
    api_instance.markArticleAsRead(itemId);
} catch (e) {
    print('Exception when calling DefaultApi->markArticleAsRead: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **itemId** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **markArticleAsUnread**
> markArticleAsUnread(itemId)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final itemId = 56; // int | 

try {
    api_instance.markArticleAsUnread(itemId);
} catch (e) {
    print('Exception when calling DefaultApi->markArticleAsUnread: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **itemId** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **markFeedAsRead**
> markFeedAsRead(feedId, newsMarkAsRead)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final feedId = 56; // int | 
final newsMarkAsRead = NewsMarkAsRead(); // NewsMarkAsRead | 

try {
    api_instance.markFeedAsRead(feedId, newsMarkAsRead);
} catch (e) {
    print('Exception when calling DefaultApi->markFeedAsRead: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **feedId** | **int**|  | 
 **newsMarkAsRead** | [**NewsMarkAsRead**](NewsMarkAsRead.md)|  | 

### Return type

void (empty response body)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **markFolderAsRead**
> markFolderAsRead(folderId, newsMarkAsRead)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final folderId = 56; // int | 
final newsMarkAsRead = NewsMarkAsRead(); // NewsMarkAsRead | 

try {
    api_instance.markFolderAsRead(folderId, newsMarkAsRead);
} catch (e) {
    print('Exception when calling DefaultApi->markFolderAsRead: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **folderId** | **int**|  | 
 **newsMarkAsRead** | [**NewsMarkAsRead**](NewsMarkAsRead.md)|  | 

### Return type

void (empty response body)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **moveFeed**
> moveFeed(feedId, newsMoveFeed)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final feedId = 56; // int | 
final newsMoveFeed = NewsMoveFeed(); // NewsMoveFeed | 

try {
    api_instance.moveFeed(feedId, newsMoveFeed);
} catch (e) {
    print('Exception when calling DefaultApi->moveFeed: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **feedId** | **int**|  | 
 **newsMoveFeed** | [**NewsMoveFeed**](NewsMoveFeed.md)|  | 

### Return type

void (empty response body)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **renameFeed**
> renameFeed(feedId, newsRenameFeed)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final feedId = 56; // int | 
final newsRenameFeed = NewsRenameFeed(); // NewsRenameFeed | 

try {
    api_instance.renameFeed(feedId, newsRenameFeed);
} catch (e) {
    print('Exception when calling DefaultApi->renameFeed: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **feedId** | **int**|  | 
 **newsRenameFeed** | [**NewsRenameFeed**](NewsRenameFeed.md)|  | 

### Return type

void (empty response body)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **renameFolder**
> renameFolder(folderId, newsRenameFolder)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final folderId = 56; // int | 
final newsRenameFolder = NewsRenameFolder(); // NewsRenameFolder | 

try {
    api_instance.renameFolder(folderId, newsRenameFolder);
} catch (e) {
    print('Exception when calling DefaultApi->renameFolder: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **folderId** | **int**|  | 
 **newsRenameFolder** | [**NewsRenameFolder**](NewsRenameFolder.md)|  | 

### Return type

void (empty response body)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **starArticle**
> starArticle(feedId, guidHash)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final feedId = 56; // int | 
final guidHash = guidHash_example; // String | 

try {
    api_instance.starArticle(feedId, guidHash);
} catch (e) {
    print('Exception when calling DefaultApi->starArticle: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **feedId** | **int**|  | 
 **guidHash** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **unstarArticle**
> unstarArticle(feedId, guidHash)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: basic_auth
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('basic_auth').password = 'YOUR_PASSWORD';

final api_instance = DefaultApi();
final feedId = 56; // int | 
final guidHash = guidHash_example; // String | 

try {
    api_instance.unstarArticle(feedId, guidHash);
} catch (e) {
    print('Exception when calling DefaultApi->unstarArticle: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **feedId** | **int**|  | 
 **guidHash** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[basic_auth](../README.md#basic_auth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

