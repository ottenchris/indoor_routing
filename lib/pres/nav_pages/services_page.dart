import 'package:design_system_flutter/design_system_flutter.dart';
import 'package:flutter/material.dart';

import '../request_aid_pages/request_aid_page.dart';
import '../support_pages/support_page.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: sbbDefaultSpacing / 2),
        children: [
          const SBBListHeader('Allgemein'),
          const Card(
            margin: EdgeInsets.symmetric(vertical: sbbDefaultSpacing / 4),
            child: ListTile(
              title: Text('Türknopf'),
              subtitle: Text(
                'Finden Sie mit Ihrer Kamera Türen und Türknöpfe von Zügen der SBB.',
              ),
              leading: Icon(SBBIcons.fullscreen_small),
              trailing: Icon(SBBIcons.chevron_small_right_small),
              onTap: null,
            ),
          ),
          const Card(
            margin: EdgeInsets.symmetric(vertical: sbbDefaultSpacing / 4),
            child: ListTile(
              title: Text('Notfall'),
              subtitle: Text(
                'Holen Sie per Telefon Hilfe von der Transportpolizei.',
              ),
              leading: Icon(SBBIcons.warning_light_small),
              trailing: Icon(SBBIcons.chevron_small_right_small),
              onTap: null,
            ),
          ),
          const SBBListHeader('Umstiegshilfe'),
          Card(
            margin: const EdgeInsets.symmetric(vertical: sbbDefaultSpacing / 4),
            child: ListTile(
                title: const Text('Umstiegshilfe'),
                subtitle: const Text(
                  'Fragen Sie andere Reisende, ob sie Ihnen beim Umsteigen helfen können.',
                ),
                leading: const Icon(SBBIcons.arrows_long_right_left_small),
                trailing: const Icon(SBBIcons.chevron_small_right_small),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RequestAidPage(),
                  ));
                }),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: sbbDefaultSpacing / 4),
            child: ListTile(
              title: const Text('Hilfe offerieren'),
              subtitle: const Text(
                'Helfen Sie anderen Reisenden, indem Sie sich als Helfer registrieren.',
              ),
              leading: const Icon(SBBIcons.hand_user_small),
              trailing: const Icon(SBBIcons.chevron_small_right_small),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SupportPage(),
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
