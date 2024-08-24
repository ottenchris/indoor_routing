import 'package:design_system_flutter/design_system_flutter.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const SBBHeader(title: 'Einstellungen'),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: sbbDefaultSpacing / 2),
          child: Column(
            children: [
              /// General
              const SBBListHeader('Allgemein'),
              SBBGroup(
                child: Column(
                  children: [
                    SBBListItem(
                      title: 'Benachrichtigungen',
                      leadingIcon: SBBIcons.bell_small,
                      trailingIcon: SBBIcons.chevron_small_right_circle_small,
                      onPressed: null,
                    ),
                    SBBListItem(
                      title: 'Haltestellen',
                      leadingIcon: SBBIcons.station_surrounding_area_small,
                      trailingIcon: SBBIcons.chevron_small_right_circle_small,
                      onPressed: null,
                    ),
                    SBBListItem(
                      title: 'Datenschutz',
                      leadingIcon: SBBIcons.lock_closed_small,
                      trailingIcon: SBBIcons.chevron_small_right_circle_small,
                      isLastElement: true,
                      onPressed: null,
                    ),
                  ],
                ),
              ),

              /// Contact
              const SBBListHeader('Kontakt'),
              SBBGroup(
                child: Column(
                  children: [
                    SBBListItem(
                      title: 'Kontakt',
                      leadingIcon: SBBIcons.two_speech_bubbles_small,
                      trailingIcon: SBBIcons.chevron_small_right_circle_small,
                      onPressed: null,
                      isLastElement: true,
                    ),
                  ],
                ),
              ),

              /// Help
              const SBBListHeader('Hilfe'),
              SBBGroup(
                child: Column(
                  children: [
                    SBBListItem(
                      title: 'App Rundgang',
                      //TODO: Change to "Rundgang" icon
                      leadingIcon: SBBIcons.smartphone_small,
                      trailingIcon: SBBIcons.chevron_small_right_circle_small,
                      onPressed: null,
                    ),
                    SBBListItem(
                      title: 'Türknopf',
                      leadingIcon: SBBIcons.fullscreen_small,
                      trailingIcon: SBBIcons.chevron_small_right_circle_small,
                      isLastElement: true,
                      onPressed: null,
                    ),
                  ],
                ),
              ),

              /// About
              const SBBListHeader('Informationen'),
              SBBGroup(
                child: Column(
                  children: [
                    SBBListItem(
                      title: 'AGB',
                      leadingIcon: SBBIcons.circle_information_small,
                      trailingIcon: SBBIcons.chevron_small_right_circle_small,
                      onPressed: null,
                    ),
                    SBBListItem(
                      title: 'Zertifikat Barrierefreiheit',
                      leadingIcon: SBBIcons.certificate_ribbon_small,
                      trailingIcon: SBBIcons.chevron_small_right_circle_small,
                      onPressed: null,
                    ),
                    SBBListItem(
                      title: 'Datenschutzbestimmungen',
                      leadingIcon: SBBIcons.paragraph_small,
                      trailingIcon: SBBIcons.chevron_small_right_circle_small,
                      isLastElement: true,
                      onPressed: null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
