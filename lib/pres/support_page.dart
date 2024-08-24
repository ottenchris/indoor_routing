import 'package:design_system_flutter/design_system_flutter.dart';
import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SBBHeader(title: 'Support'),
      body: Center(
        child: Text('Support Page'),
      ),
    );
  }
}
