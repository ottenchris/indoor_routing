import 'package:flutter/foundation.dart';
import 'package:sbb_maps_flutter/src/sbb_map_poi/sbb_map_poi.dart';

/// Controls visibility and selection of the ROKAS POIs
/// embedded in the [_kRokasPoiLayerId] layer of the ROKAS map styles.
///
/// Using this class will only work,
/// when the according [SBBMap] is used with a [SBBRokasMapStyler] style.
///
/// POIs can be filtered by their category. The available categories
/// can be queried with [availablePOICategories].
///
/// The [SBBRokasPOIController] is a [ChangeNotifier] and notifies listeners
/// when the POI visibility or the POI category filter changes.
abstract class SBBRokasPOIController with ChangeNotifier {
  /// Get the available POI categories.
  List<SBBPoiCategoryType> get availablePOICategories;

  /// Gets the currently applied POI category's filter.
  List<SBBPoiCategoryType> get currentPOICategories;

  /// Indicates the current visibility of the POIs.
  bool get isPointsOfInterestVisible;

  /// Shows ROKAS POIs on the map.
  ///
  /// Only POIs of the given categories will be visible.
  /// If the argument is null, POIs from all [availablePOICategories]
  /// will be shown.
  ///
  /// The currently applied POI category's filter can be queried with
  /// [currentPOICategories].
  Future<void> showPointsOfInterest({List<SBBPoiCategoryType>? categories});

  /// Hide ROKAS POIs on the map.
  Future<void> hidePointsOfInterest();

  /// For programmatic selection of a POI.
  ///
  /// Only works if the POIs are visible.
  Future<void> selectPointOfInterest({required String sbbId});

  /// Deselects the currently selected POI.
  ///
  /// Only works if the POIs are visible.
  Future<void> deselectPointOfInterest();

  /// The currently selected POI.
  RokasPOI? get selectedPointOfInterest;
}
