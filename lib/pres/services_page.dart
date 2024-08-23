import 'package:flutter/material.dart';
import 'package:design_system_flutter/design_system_flutter.dart';
import '../native_app.dart';

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
    _DemoItem('Bahnhof', SBBIcons.train_small),
    _DemoItem('Haltestelle', SBBIcons.station_small),
    _DemoItem('Unterwegs', SBBIcons.archive_box_small),
    _DemoItem('Services', SBBIcons.arrow_compass_small),
    _DemoItem('Einstellungen', SBBIcons.adult_kids_large),
  ];

  bool visible = true;
  late TabBarController controller = TabBarController(items.first);

  @override
  Widget build(BuildContext context) {
    final sbbToast = SBBToast.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: SBBHeader(
        title: 'Services',
        onPressedLogo: () => Navigator.maybePop(context),
        logoTooltip: 'Back to home',
      ),
      body: ListView(
        padding: const EdgeInsets.all(sbbDefaultSpacing),
        children: [
          // ThemeModeSegmentedButton(),
          const SizedBox(height: sbbDefaultSpacing),
          SBBGroup(
            child: Column(
              children: <Widget>[
                SBBListItem(
                  title: 'Türknopf',
                  subtitleMaxLines: 2,
                  subtitle:
                      'Finden Sie mit Ihrer Kamera Türen und Türknöpfe von Zügen der SBB.',
                  leadingIcon: SBBIcons.checkpoints_small,
                  onPressed: null,
                ),
                SBBListItem(
                  title: 'Notfall',
                  subtitleMaxLines: 2,
                  subtitle:
                      'Holen Sie per Telefon Hilfe von der Transportpolizei.',
                  leadingIcon: SBBIcons.alarm_clock_large,
                  onPressed: () => sbbToast.show(message: 'Testmessage'),
                ),
                SBBListItem(
                  title: 'Unterstützung für Sehbehinderte',
                  subtitleMaxLines: 2,
                  subtitle:
                      'Senden sie an Personen im Zug eine Nachricht, mit der Bitte sie am Bahnhof zu navigieren.',
                  leadingIcon: SBBIcons.hand_fingers_snap_large,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ServicesPage()),
                    );
                  }, //TODO: Create new page for Request
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SBBGroup(
        child: SBBTabBar(
          items: items,
          onTabChanged: (task) async {},
          controller: controller,
          warningSemantics: 'Warning',
          // onTap: (tab) {
          //   sbbToast.show(message: 'Tab tapped: Item ${tab.id}');
          // },
        ),
      ),
    );
  }
}
