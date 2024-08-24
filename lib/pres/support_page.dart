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
  int loadingCount = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            loadingCount++;
            if (loadingCount == 2) {
              setState(() {
                isLoading = false;
              });
            }
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
      body: Center(
        child: WebViewWidget(
              controller: controller,
            ),
      ),
    );
  }
}
