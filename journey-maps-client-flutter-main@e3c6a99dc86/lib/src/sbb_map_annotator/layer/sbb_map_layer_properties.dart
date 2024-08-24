import 'package:maplibre_gl/maplibre_gl.dart';

part 'sbb_map_symbol_layer.dart';

part 'sbb_map_circle_layer.dart';

part 'sbb_map_line_layer.dart';

part 'sbb_map_fill_layer.dart';

sealed class SBBMapLayerProperties {
  /// Used to create the expressions for the MapLibre GL renderer.
  LayerProperties makeLayerExpressions();
}
