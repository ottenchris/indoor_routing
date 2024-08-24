import 'package:design_system_flutter/design_system_flutter.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'thank_you_page.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  late final WebViewController controller;
  String fromStation = 'Bern Wankdorf';
  String toStation = 'Zürich HB';
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
            Timer(Duration(seconds: 4), () {
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
              }, 4000);

            ''');
          },
        ),
      )
      ..loadRequest(
        Uri.parse('https://www.sbb.ch/de?date=%222024-08-23%22&moment=%22DEPARTURE%22&selected_leg=2&selected_trip=0&stops=%5B%7B%22value%22%3A%228516161%22%2C%22type%22%3A%22ID%22%2C%22label%22%3A%22'+ fromStation +'%22%7D%2C%7B%22value%22%3A%228503000%22%2C%22type%22%3A%22ID%22%2C%22label%22%3A%22'+ toStation +'%22%7D%5D&time=%2222%3A02%22'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SBBHeader(title: 'Support'),
      body:
        Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            WebViewWidget(
              controller: controller,
            ),
Align(
      alignment: Alignment.bottomCenter, // Aligns the card at the bottom
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: sbbDefaultSpacing / 4, horizontal: sbbDefaultSpacing / 2),
        child: IntrinsicHeight( // Makes the Card as small as possible
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0), // Optional: Adjust padding
            title: const Text('Wir sind am Ziel'),
            leading: const Icon(SBBIcons.tick_medium),
            trailing: const Icon(SBBIcons.chevron_small_right_small),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ThankYouPage()),
              );
            },
          ),
        ),
      ),
    ),
            if(showHelpQuestion)
              Card(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // Removes the border radius
              ),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: const Text('Helfe Bernd Umzusteigen'),
                      subtitle: const Text(
                          'Bernd ist sehbehindert und braucht deine Hilfe. Bringe Bernd von Gleis 2 zu Gleis 8.'),
                      leading: const Icon(SBBIcons.hand_plus_circle_small),
                    ),
                      ButtonBar(
                        children: <Widget>[
                          TextButton(
                            onPressed: waitForMap
                                ? null // Disable the button when waitForMap is true
                                : () {
                                    // Add your button's onPressed logic here
                                    setState(() {
                                      showHelpQuestion = false;
                                    });
                                  },
                            child: Row(
                              mainAxisSize: MainAxisSize.min, // Ensures the row fits its content
                              children: [
                                if (waitForMap)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0), // Space between indicator and text
                                    child: SizedBox(
                                      width: 16,
                                      height: 16,
                                      child:
                                      SBBLoadingIndicator()
                                      // CircularProgressIndicator(
                                      //   strokeWidth: 2.0,
                                      //   color: Colors.grey,
                                      // ),
                                    ),
                                  ),
                                const Text('Los gehts!'),
                              ],
                            ),
                          ),
                          // Add more buttons here if needed, with similar logic for enabling/disabling
                        ],
                      ),
                  ],
                )
              ),
          ],
        )
    );
  }
}
