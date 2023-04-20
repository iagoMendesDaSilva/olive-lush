import 'package:flutter/material.dart';
import 'package:olive_lush/colors.dart' as AppColors;
import 'package:olive_lush/screens/screens.dart';
import 'package:olive_lush/typography.dart' as Typography;
import 'package:olive_lush/strings.dart' as StringResource;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentScreen = 0;
  final List<Widget> _screens = [DiscoverScreen(), DrinksScreen(), CollectionScreen()];

  void onTabTapped(int index) {
    setState(() {
      _currentScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Olive Lush",
        theme: ThemeData(scaffoldBackgroundColor: AppColors.background, textTheme: Typography.textTheme),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(child: _screens[_currentScreen],  padding: new EdgeInsets.all(25),),
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: false,
            selectedItemColor: AppColors.primary,
            currentIndex: _currentScreen,
            onTap: onTabTapped,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: StringResource.strings['discover']),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_bar), label: StringResource.strings['drinks']),
              BottomNavigationBarItem(
                  icon: Icon(Icons.liquor), label: StringResource.strings['collection']),
            ],
          ),
        ));
  }
}