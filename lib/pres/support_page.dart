import 'package:design_system_flutter/design_system_flutter.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            print('Page finished loading: $url');
            // Execute custom JavaScript after the page has finished loading
            controller.runJavaScript('''
              // Your custom JavaScript code here
              // document.getElementsByClassName("bg-anthracite")[0].style.height = "100%"; // Increase the size of the map
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
            if(showHelpQuestion)
              Card(
                margin: const EdgeInsets.symmetric(vertical: sbbDefaultSpacing / 4),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: const Text('Jemand braucht hilfe'),
                      subtitle: const Text(
                          'Helfen sie einer Person zum nächsten Gleis zu gelangen.'),
                      leading: const Icon(SBBIcons.hand_plus_circle_small),
                      onTap: () {},
                    ),
                    ButtonBar(
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            // Add your button's onPressed logic here
                            setState(() {
                              showHelpQuestion = false;
                            });
                          },
                          child: const Text('Hilfe leisten'),
                        ),
                        // You can add more buttons here if needed
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
