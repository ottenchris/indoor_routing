import 'package:flutter/foundation.dart';

/// Control the floor selection and available floors of a [SBBMap].
///
/// This will only work well, when used with a [SBBRRokasMapStyler] style.
abstract class SBBMapFloorController with ChangeNotifier {
  /// Get the available floors in DESC order.
  ///
  /// If no floors are available, the list will be empty.
  List<int> get availableFloors;

  /// Switch the current floor of the map by applying layer filters.
  ///
  /// Will fail silently if the floor is not available.
  /// If the argument is null, all filters will be reset to the '0' level.
  Future<void> switchFloor(int? floor);

  /// Get the current floor of the map.
  ///
  /// Will return null if no floor is selected.
  /// This corresponds to the '0' level of the map.
  int? get currentFloor;
}
