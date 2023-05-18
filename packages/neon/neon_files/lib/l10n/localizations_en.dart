import 'localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get delete => 'Delete';

  @override
  String get rename => 'Rename';

  @override
  String get move => 'Move';

  @override
  String get copy => 'Copy';

  @override
  String get disabled => 'Disabled';

  @override
  String get general => 'General';

  @override
  String get uploadFiles => 'Upload files';

  @override
  String get uploadImages => 'Upload images';

  @override
  String get uploadCamera => 'Upload from camera';

  @override
  String get createFolder => 'Create folder';

  @override
  String get folderName => 'Folder name';

  @override
  String get renameFolder => 'Rename folder';

  @override
  String get renameFile => 'Rename file';

  @override
  String get details => 'Details';

  @override
  String get detailsFileName => 'File name';

  @override
  String get detailsFolderName => 'Folder name';

  @override
  String get detailsParentFolder => 'Parent folder';

  @override
  String get detailsFileSize => 'File size';

  @override
  String get detailsFolderSize => 'Folder size';

  @override
  String get detailsLastModified => 'Last modified';

  @override
  String get detailsIsFavorite => 'Is favorite';

  @override
  String get sync => 'Sync';

  @override
  String deleteFileConfirm(String name) {
    return 'Are you sure you want to delete the file \'$name\'?';
  }

  @override
  String deleteFolderConfirm(String name) {
    return 'Are you sure you want to delete the folder \'$name\'?';
  }

  @override
  String get chooseFolder => 'Choose folder';

  @override
  String get addToFavorites => 'Add to favorites';

  @override
  String get removeFromFavorites => 'Remove from favorites';

  @override
  String confirmUploadSizeWarning(String warningSize, String actualSize) {
    return 'Are you sure you want to upload a file that is bigger than $warningSize ($actualSize)?';
  }

  @override
  String confirmDownloadSizeWarning(String warningSize, String actualSize) {
    return 'Are you sure you want to download a file that is bigger than $warningSize ($actualSize)?';
  }

  @override
  String goToPath(String path) {
    return 'Go to /$path';
  }

  @override
  String get optionsFilesSortProperty => 'How to sort files';

  @override
  String get optionsFilesSortPropertyName => 'Name';

  @override
  String get optionsFilesSortPropertyModifiedDate => 'Last modified';

  @override
  String get optionsFilesSortPropertySize => 'Size';

  @override
  String get optionsFilesSortOrder => 'Sort order of files';

  @override
  String get optionsShowPreviews => 'Show previews for files';

  @override
  String get optionsUploadQueueParallelism => 'Upload queue parallelism';

  @override
  String get optionsDownloadQueueParallelism => 'Download queue parallelism';

  @override
  String get optionsUploadSizeWarning => 'Upload size warning';

  @override
  String get optionsDownloadSizeWarning => 'Download size warning';
}
