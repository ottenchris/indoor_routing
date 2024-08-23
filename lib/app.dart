import 'package:flutter/material.dart';
import 'package:design_system_flutter/design_system_flutter.dart' as dsf;
import 'pres/services_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: dsf.SBBTheme.light(),
      home: const ServicesPage(),
    );
  }
}
