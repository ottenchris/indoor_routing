import 'package:design_system_flutter/design_system_flutter.dart';
import 'package:flutter/material.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SBBHeader(title: 'Danke'),
      body: Center(
        child: Text('Vielen Dank dass du Bernd geholfen hast!'),
      ),
    );
  }
}
