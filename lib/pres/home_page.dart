import 'package:flutter/material.dart';
import 'package:design_system_flutter/design_system_flutter.dart' as dsf;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const dsf.SBBHeader(
        title: 'Header',
      ),
      body: dsf.SBBPrimaryButton(
        label: "label",
        onPressed: () {},
      ),
    );
  }
}
