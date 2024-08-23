import 'package:design_system_flutter/design_system_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbb_maps_example/routes/camera_route.dart';
import 'package:sbb_maps_example/routes/custom_ui_route.dart';
import 'package:sbb_maps_example/routes/display_annotations_route.dart';
import 'package:sbb_maps_example/routes/features_route.dart';
import 'package:sbb_maps_example/routes/map_properties_route.dart';
import 'package:sbb_maps_example/routes/plain_map_route.dart';
import 'package:sbb_maps_example/routes/poi_route.dart';
import 'package:sbb_maps_example/routes/standard_map_route.dart';
import 'package:sbb_maps_example/theme_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final themeProvider = ThemeProvider();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => themeProvider,
      child: Consumer<ThemeProvider>(
        builder: (BuildContext context, ThemeProvider themeProvider, _) =>
            MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: SBBTheme.light(),
          darkTheme: SBBTheme.dark(),
          themeMode: themeProvider.isDark ? ThemeMode.dark : ThemeMode.light,
          initialRoute: '/features',
          routes: {
            '/features': (context) => const FeaturesRoute(),
            '/plain': (context) => const PlainMapRoute(),
            '/camera': (context) => const CameraRoute(),
            '/standard': (context) => const StandardMapRoute(),
            '/custom_ui': (context) => const CustomUiRoute(),
            '/poi': (context) => const POIRoute(),
            '/map_properties': (context) => const MapPropertiesRoute(),
            '/display_annotations': (context) =>
                const DisplayAnnotationsRoute(),
          },
        ),
      ),
    );
  }
}
