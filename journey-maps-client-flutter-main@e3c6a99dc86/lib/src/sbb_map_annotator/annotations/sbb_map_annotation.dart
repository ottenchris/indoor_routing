// coverage:ignore-file
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:sbb_maps_flutter/sbb_maps_flutter.dart';
import 'package:sbb_maps_flutter/src/utils/random_string.dart';

part 'sbb_map_symbol.dart';

part 'sbb_rokas_icon.dart';

part 'sbb_map_circle.dart';

part 'sbb_map_line.dart';

part 'sbb_map_fill.dart';

const _kPropertyTypeKey = 'sbbAnnotationType';

/// Annotations for the [SBBMap].
///
/// Use one of the concrete subtypes to add annotations
/// with the [SBBMapAnnotator], e.g.
/// * [SBBMapSymbol]
/// * [SBBRokasIcon]
sealed class SBBMapAnnotation {
  /// A unique identifier for this annotation.
  ///
  /// The identifier is a random unique 16 alpha numeric character string.
  String get id;

  /// Used to associate custom data with the annotation.
  Map<String, dynamic>? get data;

  /// Used by [SBBMap] to embed the annotation into the map.
  Map<String, dynamic> toGeoJson();

  /// Used by [SBBMapAnnotator] to build the map layers for the specific annotation
  /// only using filters.
  List<Object> get annotationFilter;
}
