import 'package:flutter/material.dart';
import 'package:design_system_flutter/design_system_flutter.dart' as dsf;
import 'package:indoor_routing/pres/home_page.dart';
import 'pres/services_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: dsf.SBBTheme.dark(),
      home: const HomePage(),
    );
  }
}
