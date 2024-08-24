import 'package:flutter/material.dart';
import 'package:design_system_flutter/design_system_flutter.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _DemoItem extends TabBarItem {
  _DemoItem(String id, IconData icon) : super(id, icon);

  @override
  String translate(BuildContext context) => id;
}

class _ServicesPageState extends State<ServicesPage> {
  final items = <TabBarItem>[
    _DemoItem('Bahnhof', SBBIcons.station_small),
    _DemoItem('Haltestelle', SBBIcons.bus_stop_small),
    _DemoItem('Unterwegs', SBBIcons.train_profile_signal_small),
    _DemoItem('Services', SBBIcons.hand_plus_circle_small),
    _DemoItem('Einstellungen', SBBIcons.gears_small),
  ];

  late TabBarController controller = TabBarController(items.first);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const SBBHeader(title: 'Services'),
      body: ListView(
        padding: const EdgeInsets.all(sbbDefaultSpacing),
        children: [
          // ThemeModeSegmentedButton(),
          Column(
            children: <Widget>[
              SBBCard(
                body: SBBListItem(
                  title: 'Türknopf',
                  subtitleMaxLines: 2,
                  subtitle:
                      'Finden Sie mit Ihrer Kamera Türen und Türknöpfe von Zügen der SBB.',
                  leadingIcon: SBBIcons.fullscreen_small,
                  trailingIcon: SBBIcons.chevron_small_right_small,
                  onPressed: null,
                ),
              ),
              const SizedBox(height: sbbDefaultSpacing),
              SBBCard(
                body: SBBListItem(
                  title: 'Notfall',
                  subtitleMaxLines: 2,

                  subtitle:
                      'Holen Sie per Telefon Hilfe von der Transportpolizei.',
                  leadingIcon: SBBIcons.warning_light_medium,
                  trailingIcon: SBBIcons.chevron_small_right_small,
                  onPressed: null,
                ),
              ),
              const SizedBox(height: sbbDefaultSpacing),
              SBBCard(
                body: SBBListItem(
                  title: 'Unterstützung für Sehbehinderte',
                  subtitleMaxLines: 2,
                  subtitle:
                      'Senden sie an Personen im Zug eine Nachricht, mit der Bitte sie am Bahnhof zu navigieren.',
                  leadingIcon: SBBIcons.hand_fingers_snap_large,
                  trailingIcon: SBBIcons.chevron_small_right_small,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ServicesPage()),
                    );
                  }, //TODO: Create new page for Request
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: SBBTabBar(
        items: items,
        onTabChanged: (task) async {},
        controller: controller,
        warningSemantics: 'Warning',
        // onTap: (tab) {
        //   sbbToast.show(message: 'Tab tapped: Item ${tab.id}');
        // },
      ),
    );
  }
}
