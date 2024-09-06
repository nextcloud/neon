# neon

A beautiful convergent cross-platform client for Nextcloud written in Flutter.

## Install
You can build it yourself from source or download it from the automatic build pipelines.  
The app will be published on F-Droid, the Google Playstore and Flathub later on.

### F-Droid nightly

An easy way to try out the app is to use the [F-Droid](https://f-droid.org) nightly repository:

[https://raw.githubusercontent.com/provokateurin/nextcloud-neon-nightly/master/fdroid/repo](https://fdroid.link/#https://raw.githubusercontent.com/provokateurin/nextcloud-neon-nightly/master/fdroid/repo?fingerprint=A4680F314E0B73F7309094A9C32549FDFF11CCD271C5CFC770FF58D275FD9B80)

<img src="https://raw.githubusercontent.com/provokateurin/nextcloud-neon-nightly/master/fdroid/repo/index.png" alt="QR Code - for F-Droid" width="300"/>

### Classic Nextcloud app

You can also install Neon as a classic app on your Nextcloud server: https://apps.nextcloud.com/apps/neon_web

Please note that it is highly experimental and likely contains unknown bugs. Feel free to report them here.

## Run on web

Due to CORS issues the app must be run with web security disabled.

```bash
fvm flutter run -d chrome --web-browser-flag "--disable-web-security"
```

## Build and run the Flatpak

```bash
flatpak-builder --user --install --force-clean build-dir de.provokateurin.neon.yaml

flatpak run de.provokateurin.neon
```

## Screenshots

For more screenshots see `./screenshots/`.

| ![](https://raw.githubusercontent.com/nextcloud/neon/main/packages/neon_framework/example/screenshots/login_server_selection.png) | ![](https://raw.githubusercontent.com/nextcloud/neon/main/packages/neon_framework/example/screenshots/home_drawer.png)               | ![](https://raw.githubusercontent.com/nextcloud/neon/main/packages/neon_framework/example/screenshots/settings_oled.png)   |
|-----------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------|
| ![](https://raw.githubusercontent.com/nextcloud/neon/main/packages/neon_framework/example/screenshots/files_photos.png)           | ![](https://raw.githubusercontent.com/nextcloud/neon/main/packages/neon_framework/example/screenshots/news_articles_unread_list.png) | ![](https://raw.githubusercontent.com/nextcloud/neon/main/packages/neon_framework/example/screenshots/notes_note_edit.png) |
| ![](https://raw.githubusercontent.com/nextcloud/neon/main/packages/neon_framework/example/screenshots/notifications_list.png)     |                                                                                                                                      |                                                                                                                            |
