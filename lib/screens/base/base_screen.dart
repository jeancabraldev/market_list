import 'package:flutter/material.dart';
import 'package:market_list/models/page/page_manager.dart';
import 'package:market_list/screens/about/about_screen.dart';
import 'package:market_list/screens/home/home_screen.dart';
import 'package:market_list/screens/setting/settings_screen.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomeScreen(),
          AboutScreen(),
          SettingScreen(),
        ],
      ),
    );
  }
}
