# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.0.0] - 2024-06-11

### Changed

- Upgrade minimum dart sdk to 3.2.0
- Relax constraints on geolocator dependency to >=11.0.0 <=13.0.0
- Upgrade maplibre_gl plugin to 0.20.0
    - BREAKING CHANGE: uses lower camel case for enums and constans
      (e.g. `CompassViewPosition.TopLeft` => `CompassViewPosition.topLeft`)
    - BREAKING CHANGE: uses `maplibre-native` for iOS 6.5.0 under the hood (only iOS Devices with an
      Apple A7 GPU are supported from now on)
    - BREAKING CHANGE: uses `maplibre-native` for Android 11.0.0 under the hood
    - adds Swift Package Manager support
    - Swift replaces Objective C under the hood

### Added

- add `SBBMapLine`: adds ability to draw line annotations.
- add `SBBMapLineStyle`: adds ability to style line annotations.
- add `SBBMapFill`: adds ability to draw fill annotations.
- add `SBBMapFillStyle`: adds ability to style fill annotations.
- `SBBMapAnnotator`: add `onLineTapped` callback and `onFillTapped` callback.

### Fixed

- Clarified behavior of onXAvailable callbacks: only called first time style is loaded. Affects:
    - `onMapLocatorAvailable`
    - `onFloorControllerAvailable`
    - `onPoiControllerAvailable`
    - `onMapAnnotatorAvailable`

## [1.2.0] - 2024-06-03

### Added

- add `SBBMapAnnotator`
    - adds, removes, updates `SBBMapAnnotations`
    - exposed through `OnSBBMapAnnotatorAvailable` callback in `SBBMap`
- add `SBBMapCircle`
- add `SBBMapSymbol`

## [1.1.1] - 2024-05-27

### Changed

- Upgrade example app to `Flutter 3.22.1`.
- Switch default branch name to `main`.

### Fixed

- `onMapClick` not being triggered.

## [1.1.0] - 2024-05-24

### Changed

- Update Dependencies
    - maplibre_gl 0.18.0 -> 0.19.0
    - geolocator 10.1.0 -> 12.0.0
- Example App uses Gradle 8

## [1.0.0] - 2024-02-24

### Added

- Initial version.

[2.0.0]: https://code.sbb.ch/projects/KI_ROKAS/repos/journey-maps-client-flutter/compare/diff?sourceBranch=refs/tags/2.0.0&targetRepoId=67154&targetBranch=refs/tags/1.2.0

[1.2.0]: https://code.sbb.ch/projects/KI_ROKAS/repos/journey-maps-client-flutter/compare/diff?sourceBranch=refs/tags/1.2.0&targetRepoId=67154&targetBranch=refs/tags/1.1.1

[1.1.1]: https://code.sbb.ch/projects/KI_ROKAS/repos/journey-maps-client-flutter/compare/diff?sourceBranch=refs/tags/1.1.0&targetRepoId=67154&targetBranch=refs/tags/1.1.1

[1.1.0]: https://code.sbb.ch/projects/KI_ROKAS/repos/journey-maps-client-flutter/compare/diff?sourceBranch=refs/tags/1.1.0&targetRepoId=67154&targetBranch=e41078cb4fe57007314dae292cf38875e2354670

[1.0.0]: https://code.sbb.ch/projects/KI_ROKAS/repos/journey-maps-client-flutter/compare/diff?sourceBranch=refs/heads/main&targetRepoId=67154&targetBranch=e41078cb4fe57007314dae292cf38875e2354670