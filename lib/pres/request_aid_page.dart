import 'package:flutter/material.dart';
import 'package:design_system_flutter/design_system_flutter.dart';

class RequestAidPage extends StatefulWidget {
  const RequestAidPage({super.key});

  @override
  State<RequestAidPage> createState() => _RequestAidPageState();
}

class _DemoItem extends TabBarItem {
  _DemoItem(String id, IconData icon) : super(id, icon);

  @override
  String translate(BuildContext context) => id;
}

class _RequestAidPageState extends State<RequestAidPage> {
  final items = <TabBarItem>[
    _DemoItem('Bahnhof', SBBIcons.station_small),
    _DemoItem('Haltestelle', SBBIcons.bus_stop_small),
    _DemoItem('Unterwegs', SBBIcons.train_profile_signal_small),
    _DemoItem('Services', SBBIcons.hand_plus_circle_small),
    _DemoItem('Einstellungen', SBBIcons.gears_small),
  ];

  bool? _showInteractionButton = true;
  bool _isLoading = false;
  String _description =
      'Nachdem du deine Anfrage versendet hast, werden deine Mitfahrenden benachrichtigt, dass du Unterstützung benötigst. Wir benachrichtigen dich, wenn ein Helfer gefunden wurde.';
  String _title = 'Fordere jetzt Hilfe an.';
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
          SBBGroup(
            margin: const EdgeInsets.symmetric(horizontal: sbbDefaultSpacing),
            padding: const EdgeInsets.all(sbbDefaultSpacing),
            child: Column(
              children: [
                SBBMessage(
                  title: _title,
                  description: _description,
                  isLoading: _isLoading,
                  interactionIcon: SBBIcons.bus_sbb_medium,
                ),
                const SizedBox(height: sbbDefaultSpacing),
                if (!_isLoading) ...[
                  SBBTextField(
                    labelText: 'Dein Name',
                    controller: TextEditingController()
                      ..value = TextEditingValue(text: 'Chris Ott'),
                  ),
                  SBBTextField(
                    labelText: 'Dein Standort',
                    controller: TextEditingController()
                      ..value = TextEditingValue(text: 'Wagen 420'),
                  ),
                  SBBTextField(
                    labelText: 'Wo musst du hin?',
                    controller: TextEditingController()
                      ..value = TextEditingValue(text: 'Gleis 420'),
                  ),
                  const SizedBox(height: sbbDefaultSpacing),
                  SBBPrimaryButton(
                    label: 'Anfrage senden',
                    onPressed: () {
                      sbbToast.show(message: 'Deine Anfrage wurde versendet.');
                      setState(() {
                        _isLoading = true;
                        _title = 'Ein Helfer wird gesucht.';
                        _description =
                            'Wir benachrichtigen dich, sobald ein Helfer gefunden wurde. Bitte schließe diese Seite nicht.';
                      });
                    },
                  ),
                ]
              ],
            ),
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

  VoidCallback? _onInteractionCallback() =>
      (_showInteractionButton ?? false) ? () {} : null;
}
