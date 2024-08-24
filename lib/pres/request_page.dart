import 'package:design_system_flutter/design_system_flutter.dart';
import 'package:flutter/material.dart';

class RequestPage extends StatelessWidget {
  const RequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SBBHeader(title: 'Request'),
      body: Center(
        child: Text('Request Page'),
      ),
    );
  }
}
