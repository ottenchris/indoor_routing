import 'package:geolocator/geolocator.dart';

/// Facade for the geolocator package.
///
/// This class is used by [SBBMapLocator] as a facade
/// to the [Geolocator package](https://pub.dev/packages/geolocator).
///
/// It allows primarily for unit testing using mockito.
class GeolocatorFacade {
  /// Indicates whether location services are enabled on the device.
  Future<bool> isLocationServiceEnabled() {
    return Geolocator.isLocationServiceEnabled();
  }

  /// Indicates whether the app has been granted location permissions by the user.
  Future<LocationPermission> checkPermission() {
    return Geolocator.checkPermission();
  }

  /// Request permission to access the location of the device.
  ///
  /// Returns a [Future] which when completes indicates if
  /// the user granted permission to access the device's location.
  ///
  /// Throws a [PermissionDefinitionsNotFoundException]
  /// when the required platform specific configuration is missing
  /// (e.g. in the AndroidManifest.xml on Android or the Info.plist on iOS).
  /// A [PermissionRequestInProgressException] is thrown
  /// if permissions are requested while an earlier request
  /// has not yet been completed.
  Future<LocationPermission> requestPermission() {
    return Geolocator.requestPermission();
  }
}
