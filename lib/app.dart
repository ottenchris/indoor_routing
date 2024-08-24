import 'package:design_system_flutter/design_system_flutter.dart' as dsf;
import 'package:flutter/material.dart';
import 'package:indoor_routing/pres/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: dsf.SBBTheme.dark().copyWith(
        listTileTheme: const ListTileThemeData(
          subtitleTextStyle: TextStyle(
            color: dsf.SBBColors.smoke,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
