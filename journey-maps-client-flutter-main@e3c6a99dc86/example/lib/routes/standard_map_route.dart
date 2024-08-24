import 'package:design_system_flutter/design_system_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbb_maps_example/env.dart';
import 'package:sbb_maps_example/theme_provider.dart';
import 'package:sbb_maps_flutter/sbb_maps_flutter.dart';

class StandardMapRoute extends StatelessWidget {
  const StandardMapRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final mapStyler = SBBRokasMapStyler.full(
      apiKey: Env.journeyMapsApiKey,
      isDarkMode: Provider.of<ThemeProvider>(context).isDark,
    );
    return Scaffold(
      appBar: const SBBHeader(title: 'Standard'),
      body: SBBMap(
        initialCameraPosition: const SBBCameraPosition(
          target: LatLng(46.947456, 7.451123), // Bern
          zoom: 15.0,
        ),
        isMyLocationEnabled: true,
        mapStyler: mapStyler,
      ),
    );
  }
}
