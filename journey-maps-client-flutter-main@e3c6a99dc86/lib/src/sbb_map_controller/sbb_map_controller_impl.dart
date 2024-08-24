import 'package:flutter/material.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:sbb_maps_flutter/sbb_maps_flutter.dart';

class SBBMapControllerImpl with ChangeNotifier implements SBBMapController {
  SBBMapControllerImpl({required MapLibreMapController maplibreMapController})
      : _maplibreMapController = maplibreMapController {
    _maplibreMapController.addListener(() => notifyListeners());
  }

  final MapLibreMapController _maplibreMapController;

  @override
  void dispose() {
    super.dispose();
    _maplibreMapController.dispose();
  }

  @override
  Future getFilter(String layerId) {
    return _maplibreMapController.getFilter(layerId);
  }

  @override
  Future<void> setFilter(String layerId, dynamic filter) {
    return _maplibreMapController.setFilter(layerId, filter);
  }

  @override
  Future<void> setLayerVisibility(String layerId, bool visible) {
    return _maplibreMapController.setLayerVisibility(layerId, visible);
  }

  @override
  Future<List<dynamic>> querySourceFeatures(String sourceId,
      {String? sourceLayerId, List<Object>? filter}) {
    return _maplibreMapController.querySourceFeatures(
      sourceId,
      sourceLayerId,
      filter,
    );
  }

  @override
  bool get isCameraMoving => _maplibreMapController.isCameraMoving;

  @override
  SBBCameraPosition? get cameraPosition {
    final cameraPosition = _maplibreMapController.cameraPosition;
    if (cameraPosition != null) {
      return SBBCameraPosition(
        bearing: cameraPosition.bearing,
        target: cameraPosition.target,
        zoom: cameraPosition.zoom,
      );
    } else {
      return null;
    }
  }

  @override
  Future<bool?> animateCameraMove(
      {required SBBCameraUpdate cameraUpdate, Duration? duration}) {
    return _maplibreMapController.animateCamera(cameraUpdate.toMaplibre(),
        duration: duration);
  }
}
