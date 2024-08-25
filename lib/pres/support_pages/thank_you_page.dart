import 'package:design_system_flutter/design_system_flutter.dart';
import 'package:flutter/material.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Your custom back button logic here
        // For example, navigate to a specific route or show a confirmation dialog
        // Navigator.pop(context); // Go back to the previous page
        Navigator.pop(context);
        return false; // Prevent default back button behavior
      },
      child: const Scaffold(
        appBar: SBBHeader(
          title: 'Danke',
        ),
        body: Center(
          child: Column(
            children: [
              SBBMessage(
                title: 'Danke dass du geholfen hast!',
                description: 'Mit deiner Hilfe können alle Menschen die Bahn benutzen. Dafür wollen wir uns bedanken! Zeig diese Nachricht in einem Bordbistro oder Reisezentrum vor und wir spendieren ihnen einen Kaffee.',
                interactionIcon: SBBIcons.bus_sbb_medium,
              ),
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Icon(
                  SBBIcons.mug_hot_medium,
                  size: 128.0,
                  semanticLabel: 'Danke Icon',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
