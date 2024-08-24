import 'package:design_system_flutter/design_system_flutter.dart';
import 'package:flutter/material.dart';

class SupporterFoundPage extends StatelessWidget {
  const SupporterFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SBBHeader(title: 'Unterstüzung gefunden'),
      body: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: sbbDefaultSpacing / 2,
            vertical: sbbDefaultSpacing / 2,
          ),
          children: [
            SBBGroup(
              padding: const EdgeInsets.all(sbbDefaultSpacing / 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SBBMessage(
                    title: 'Unterstützung ist unterwegs.',
                    description:
                        'Dein Unterstüzer ist auf dem Weg zu dir, hebe die Hand um auf dich aufmerksam zu machen.',
                    interactionIcon: SBBIcons.bus_sbb_medium,
                  ),
                  const SizedBox(height: sbbDefaultSpacing),
                  SBBPrimaryButton(
                    label: 'Zurück zur Startseite',
                    onPressed: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
