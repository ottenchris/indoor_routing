import 'package:design_system_flutter/design_system_flutter.dart';
import 'package:flutter/material.dart';

class RequestAidPage extends StatefulWidget {
  const RequestAidPage({super.key});

  @override
  State<RequestAidPage> createState() => _RequestAidPageState();
}

class _RequestAidPageState extends State<RequestAidPage> {
  bool _isLoading = false;
  String _title = 'Fordere jetzt Hilfe an.';
  String _description =
      'Nachdem du deine Anfrage versendet hast, werden deine Mitfahrenden benachrichtigt, dass du Unterstützung benötigst. Wir benachrichtigen dich, wenn ein Helfer gefunden wurde.';

  @override
  Widget build(BuildContext context) {
    final sbbToast = SBBToast.of(context);

    return Scaffold(
      appBar: const SBBHeader(title: 'Umstiegshilfe'),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: sbbDefaultSpacing / 2,
          vertical: sbbDefaultSpacing / 2,
        ),
        children: [
          SBBGroup(
            padding: const EdgeInsets.all(sbbDefaultSpacing / 2),
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
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
