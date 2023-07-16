# nextcloud-neon

<img src="assets/logo.svg" alt="Neon logo" width="200"/>

A framework for building convergent cross-platform Nextcloud clients using Flutter.

## Features

See [here](packages/app/README.md) for screenshots.

- :heavy_check_mark: Supported
- :rocket: Planned

| App           | Status             |
|---------------|--------------------|
| Files         | :heavy_check_mark: |
| News          | :heavy_check_mark: |
| Notes         | :heavy_check_mark: |
| Notifications | :heavy_check_mark: |
| Activity      | :rocket:           |
| Calendar      | :rocket:           |
| Contacts      | :rocket:           |
| Cookbook      | :rocket:           |
| Dashboard     | :rocket:           |
| Photos        | :rocket:           |
| Talk          | :rocket:           |
| Tasks         | :rocket:           |

## Problems with other clients and how this project tries to solve them

### Current problems with other clients

_Excerpt from my job application to Nextcloud:_

- There are many clients that are designed to run exclusively on a single platform or device type. They all have different code bases, which makes feature parity and maintenance much more difficult.
- The user experience and features differ significantly from platform to platform, which leads to frustration. This particularly affects mobile devices running Linux (e.g. postmarketOS). There is no suitable client on this platform at all. Using the desktop Linux client for file synchronization would probably work, but this platform still lacks almost all the features available on e.g. Android and the client is not made for mobile screens. Someone who uses Linux on their mobile device is likely also interested in Nextcloud, so the need for a solution is definitely there.
- Even on feature-rich platforms, features are spread across multiple apps (e.g. on Android), making it more complicated for the user who simply wants to get the most out of their Nextcloud server on their device.

### How Neon as a framework tries to solve them

This project uses OpenAPI specifications to generate all the necessary API client code.
This vastly reduces the developer efforts of writing a lot of boilerplate code and having to look at the PHP source code.
Most server APIs were not well or at all documented until now (there are some exceptions).
Based on this work a project at the Nextcloud company started for adopting OpenAPI to document the server APIs.
The OpenAPI specifications are generated completely automated from the source code (although some changes to the type annotations are required) and are validated with static analysis of the PHP code.
These efforts are not done yet, but this project basically became the front-line for testing the automatically generated specifications.

We use flutter because of its cross-platform capabilities.
To decrease the developer burden, a lot of useful widgets and utilities have been developed, so that they can be re-used.
Trying to make everything re-usable is a major goal of this project, as we want to close the gap between platforms and functionalities and make development of new clients and apps enjoyable and fast.
Developing a new Nextcloud client can be as easy as adding some UI and then necessary state management, everything else is taken care of for you.

## Contributing

Checkout our [contributing docs](./docs/contributing.md) to get started with developing with Neon.

## Development and support

We have a Matrix space where you can ask questions: https://matrix.to/#/#nextcloud-neon:matrix.org

## Documentation

See [docs](./docs).

## Platform support

Except for web, Neon should run on all supported Flutter platforms in the future.  
Right now this is not the case, only Android and Linux are supported and tested, but this can easily be extended to other platforms.  

The features and problems of all platforms should be considered when implementing new features.
