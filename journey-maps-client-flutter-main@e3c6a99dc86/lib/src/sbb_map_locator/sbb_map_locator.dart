import 'package:flutter/material.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

/// A [ChangeNotifier] coupled to [SBBMap] handling device location.
///
/// This class is used by [SBBMap] to handle device location.
/// It will notify its listeners when the device location **changes**.
abstract class SBBMapLocator with ChangeNotifier {
  /// Returns the last known location of the device.
  ///
  /// If the location is not available, it returns null.
  LatLng? get lastKnownLocation;

  /// Whether the associated [SBBMap]
  /// is currently following the device location.
  bool get isTracking;

  /// Whether the device location is enabled and the "My Location" layer
  /// is visible on the [SBBMap].
  bool get isLocationEnabled;

  /// Enables tracking device location.
  ///
  /// This is the method called by the MyLocation button in [SBBMap].
  ///
  /// Will request user permissions if not already granted.
  ///
  /// Fails silently if the user denies the permission or the
  /// permission is permanently denied.
  Future<void> trackDeviceLocation();
}
