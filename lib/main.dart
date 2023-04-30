import 'package:flutter/material.dart';
import 'package:olive_lush/utils/colors.dart' as AppColors;
import 'package:olive_lush/screens/screens.dart';
import 'package:olive_lush/services/NetworkModule.dart';
import 'package:olive_lush/utils/theme.dart';
import 'package:olive_lush/utils/strings.dart' as StringResource;

void main() async {
  await NetworkModule.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentScreen = 0;
  final List<Widget> _screens = [
    DiscoverScreen(),
    DrinksScreen(),
    CollectionScreen()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Olive Lush",
        theme: light,
        darkTheme: dark,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
              child: _screens[_currentScreen],
              padding: new EdgeInsets.all(25),
            ),
            bottomNavigationBar: Builder(
              builder: (BuildContext context) {
                return BottomNavigationBar(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  showUnselectedLabels: false,
                  selectedItemColor: Theme.of(context).colorScheme.primary,
                  currentIndex: _currentScreen,
                  onTap: onTabTapped,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.search),
                        label: StringResource.strings['discover']),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.local_bar),
                        label: StringResource.strings['drinks']),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.liquor),
                        label: StringResource.strings['collection']),
                  ],
                );
              },
            )));
  }
}
