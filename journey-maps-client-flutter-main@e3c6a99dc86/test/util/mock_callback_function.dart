import 'package:mockito/mockito.dart';
import 'package:sbb_maps_flutter/sbb_maps_flutter.dart';
import 'package:sbb_maps_flutter/src/sbb_map_annotator/annotations/sbb_map_annotation.dart';

/// Helper to verify whether ChangeNotifier listeners are called.
class MockCallbackFunction extends Mock {
  call();
}

class MockCallbackSymbolFunction extends Mock {
  call(SBBMapSymbol s);
}

class MockCallbackRokasIconFunction extends Mock {
  call(SBBRokasIcon s);
}
