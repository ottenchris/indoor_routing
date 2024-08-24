import 'package:design_system_flutter/design_system_flutter.dart';
import 'package:flutter/material.dart';

import 'nav_pages/services_page.dart';
import 'nav_pages/settings_page.dart';
import 'nav_pages/station_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _DemoItem extends TabBarItem {
  _DemoItem(String id, IconData icon) : super(id, icon);

  @override
  String translate(BuildContext context) => id;
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
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
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const LoadingPage(title: 'Bahnhöfe'),
          const LoadingPage(title: 'Haltestellen'),
          const LoadingPage(title: 'Unterwegs'),
          const ServicesPage(),
          const SettingsPage(),
        ],
      ),
      bottomNavigationBar: SBBTabBar(
        items: items,
        onTabChanged: (Future<TabBarItem> task) async {
          TabBarItem myTask = await task;
          int newIndex = items.indexOf(myTask);

          setState(() {
            _selectedIndex = newIndex;
          });

          print('Selected: ${_selectedIndex}');
        },
        controller: controller,
      ),
    );
  }
}
