import 'package:design_system_flutter/design_system_flutter.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SBBHeader(title: title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SBBLoadingIndicator(),
            const SizedBox(height: sbbDefaultSpacing),
            Text('$title werden aktualisiert...'),
          ],
        ),
      ),
    );
  }
}
