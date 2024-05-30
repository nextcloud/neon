# neon

A beautiful convergent cross-platform client for Nextcloud written in Flutter.

## Install
You can build it yourself from source or download it from the automatic build pipelines.  
The app will be published on F-Droid, the Google Playstore and Flathub later on.

## Run on web

Due to CORS issues the app must be run with web security disabled.

```bash
fvm flutter run -d chrome --web-browser-flag "--disable-web-security"
```

### Run inside Nextcloud itself

Neon can also be installed as a normal Nextcloud app.

```bash
composer i
fvm flutter build web --no-web-resources-cdn

cd path/to/server/apps
ln -sf ../../path/to/neon/packages/app neon

cd ..
./occ app:enable neon
```

## Build and run the Flatpak

```bash
flatpak-builder --user --install --force-clean build-dir de.provokateurin.neon.yaml

flatpak run de.provokateurin.neon
```

## Screenshots

For more screenshots see `./screenshots/`.

| ![](https://raw.githubusercontent.com/nextcloud/neon/main/packages/app/screenshots/login_server_selection.png) | ![](https://raw.githubusercontent.com/nextcloud/neon/main/packages/app/screenshots/home_drawer.png)               | ![](https://raw.githubusercontent.com/nextcloud/neon/main/packages/app/screenshots/settings_oled.png)   |
|----------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| ![](https://raw.githubusercontent.com/nextcloud/neon/main/packages/app/screenshots/files_photos.png)           | ![](https://raw.githubusercontent.com/nextcloud/neon/main/packages/app/screenshots/news_articles_unread_list.png) | ![](https://raw.githubusercontent.com/nextcloud/neon/main/packages/app/screenshots/notes_note_edit.png) |
| ![](https://raw.githubusercontent.com/nextcloud/neon/main/packages/app/screenshots/notifications_list.png)     |                                                                                                                   |                                                                                                         |
