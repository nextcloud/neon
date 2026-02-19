/// The Neon client for the Photos app.
///
/// Add `PhotosApp()` to your runNeon command to execute this app.
library;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neon_framework/models.dart';
import 'package:nextcloud/photos.dart' as photos;
import 'package:photos_app/l10n/localizations.dart';
import 'package:photos_app/src/blocs/bloc.dart';
import 'package:photos_app/src/handlers/handlers.dart';
import 'package:photos_app/src/options.dart';
import 'package:photos_app/src/pages/main.dart';
import 'package:photos_app/src/routes.dart';

class PhotosApp extends AppImplementation<PhotosBloc, PhotosOptions> {
  PhotosApp();

  final ImageHandler _imageHandler = ImageHandler();

  @override
  final String id = photos.appID;

  @override
  final LocalizationsDelegate<PhotosLocalizations> localizationsDelegate = PhotosLocalizations.delegate;

  @override
  final List<Locale> supportedLocales = const [Locale('en')];

  @override
  late final PhotosOptions options = PhotosOptions(storage);

  @override
  PhotosBloc buildBloc(Account account) => PhotosBloc(
        options: options,
        account: account,
      );

  @override
  final Widget page = PhotosMainPage();

  @override
  final RouteBase route = $photosAppRoute;

  @override
  AppCapabilityHandler? appCapabilityHandler(AppCapability capability) {
    if (_imageHandler.canHandle(capability)) {
      return _imageHandler;
    }
    return null;
  }
}
