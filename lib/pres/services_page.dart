import 'package:design_system_flutter/design_system_flutter.dart';
import 'package:flutter/material.dart';

import 'request_aid_page.dart';
import 'support_page.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SBBHeader(title: 'Services'),
      body: ListView(
        padding: const EdgeInsets.symmetric(
            horizontal: sbbDefaultSpacing / 2, vertical: sbbDefaultSpacing / 2),
        children: [
          Card(
            margin: const EdgeInsets.symmetric(vertical: sbbDefaultSpacing / 4),
            child: ListTile(
              title: const Text('Türknopf'),
              subtitle: const Text(
                  'Finden Sie mit Ihrer Kamera Türen und Türknöpfe von Zügen der SBB.'),
              leading: const Icon(SBBIcons.fullscreen_small),
              trailing: const Icon(SBBIcons.chevron_small_right_small),
              onTap: () {},
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: sbbDefaultSpacing / 4),
            child: ListTile(
              title: const Text('Notfall'),
              subtitle: const Text(
                  'Holen Sie per Telefon Hilfe von der Transportpolizei.'),
              leading: const Icon(SBBIcons.warning_light_small),
              trailing: const Icon(SBBIcons.chevron_small_right_small),
              onTap: () {},
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: sbbDefaultSpacing / 4),
            child: ListTile(
              title: const Text('Unterstützung für Sehbehinderte'),
              subtitle: const Text(
                  'Senden sie an Personen im Zug eine Nachricht, mit der Bitte sie am Bahnhof zu navigieren.'),
              leading: const Icon(SBBIcons.hand_fingers_snap_small),
              trailing: const Icon(SBBIcons.chevron_small_right_small),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RequestAidPage()),
                );
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: sbbDefaultSpacing / 4),
            child: ListTile(
              title: const Text('Helfen Sie'),
              subtitle: const Text(
                  'Helfen Sie anderen Reisenden, indem Sie sich als Helfer registrieren.'),
              leading: const Icon(SBBIcons.hand_plus_circle_small),
              trailing: const Icon(SBBIcons.chevron_small_right_small),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SupportPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
