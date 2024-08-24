import 'package:flutter/material.dart';
import 'package:design_system_flutter/design_system_flutter.dart' as dsf;
import 'services_page.dart'; // Import the new page

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dsf.SBBHeader(title: 'Home Page'),
      body: const ServicesPage(), // Use the new page
    );
  }
}
