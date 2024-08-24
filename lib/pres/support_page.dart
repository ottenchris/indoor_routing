import 'dart:async';

import 'package:design_system_flutter/design_system_flutter.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../data.dart';
import 'thank_you_page.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  late final WebViewController controller;
  String fromStation = Data.startStation;
  String toStation = Data.endStation;
  bool showHelpQuestion = true;
  bool waitForMap = true;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            print('Page finished loading: $url');
            Timer(const Duration(seconds: 3), () {
              setState(() {
                waitForMap = false;
              });
            });
            // Execute custom JavaScript after the page has finished loading
            controller.runJavaScript('''
              // Your custom JavaScript code here
              // document.getElementsByClassName("bg-anthracite")[0].style.height = "100%"; // Increase the size of the map
              setTimeout(function() {
                document.getElementsByTagName("sbb-secondary-button")[0].style.display = "none" // Hide the close button on top right
                document.getElementsByClassName("map-widgets")[0].style.marginTop = "0" // Move the map to the top right
                document.querySelectorAll('[data-testid="overlay-navigation"]')[0].style.display = "none" // Hide the overlay navigation
              }, 3000);

            ''');
          },
        ),
      )
      ..loadRequest(
        /// Link: https://www.sbb.ch/de?date=%222024-08-23%22&moment=%22DEPARTURE%22&selected_leg=2&selected_trip=0&stops=%5B%7B%22value%22%3A%228516161%22%2C%22type%22%3A%22ID%22%2C%22label%22%3A%22Bern%20Wankdorf%22%7D%2C%7B%22value%22%3A%228503000%22%2C%22type%22%3A%22ID%22%2C%22label%22%3A%22Z%C3%BCrich%20HB%22%7D%5D&time=%2222%3A02%22
        Uri.parse(
            'https://www.sbb.ch/de?date=%222024-08-23%22&moment=%22DEPARTURE%22&selected_leg=2&selected_trip=0&stops=%5B%7B%22value%22%3A%228516161%22%2C%22type%22%3A%22ID%22%2C%22label%22%3A%22' +
                fromStation +
                '%22%7D%2C%7B%22value%22%3A%228503000%22%2C%22type%22%3A%22ID%22%2C%22label%22%3A%22' +
                toStation +
                '%22%7D%5D&time=%2222%3A02%22'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const SBBHeader(title: 'Support'),
        body: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            WebViewWidget(
              controller: controller,
            ),

            /// Bottom "Wir sind am Ziel" Button
            Align(
              alignment: Alignment.bottomCenter,
              // Aligns the card at the bottom
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SBBPrimaryButton(
                  label: 'Wir sind am Ziel',
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ThankYouPage()),
                    );
                  },
                ),
              ),
            ),
            if (showHelpQuestion)
              Container(
                  padding: const EdgeInsets.all(sbbDefaultSpacing / 2),
                  color: SBBColors.black,
                  child: Column(
                    children: <Widget>[
                      const Card(
                        margin: EdgeInsets.symmetric(
                          vertical: sbbDefaultSpacing / 4,
                        ),
                        child: ListTile(
                          leading: Icon(SBBIcons.hand_user_small),
                          title: Text('Hilf Bernd Umzusteigen'),
                          subtitle: Text(
                              'Bernd ist sehbehindert und braucht deine Hilfe. \nBringe Bernd von ${Data.startPlatform} zu ${Data.endPlatform}.'),
                        ),
                      ),
                      const Card(
                        margin: EdgeInsets.symmetric(
                          vertical: sbbDefaultSpacing / 4,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(sbbDefaultSpacing),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(Data.startPlatform,
                                      textAlign: TextAlign.center),
                                  Text(
                                    Data.startWagon,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: SBBColors.smoke),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.blind_outlined,
                                size: 64.0,
                                semanticLabel: 'Danke Icon',
                              ),
                              Column(
                                children: [
                                  Text(Data.endPlatform,
                                      textAlign: TextAlign.center),
                                  Text(
                                    Data.endSection,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: SBBColors.smoke),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: sbbDefaultSpacing),
                      Align(
                          alignment: Alignment.centerRight,
                          child: SBBTertiaryButtonLarge(
                              isLoading: waitForMap,
                              label: 'Los gehts!',
                              onPressed: waitForMap
                                  ? null // Disable the button when waitForMap is true
                                  : () {
                                      // Add your button's onPressed logic here
                                      setState(() {
                                        showHelpQuestion = false;
                                      });
                                    })),
                    ],
                  )),
          ],
        ));
  }
}
