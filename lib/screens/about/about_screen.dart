import 'package:flutter/material.dart';
import 'package:market_list/widget/drawer/drawer.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text('Sobre'),
      ),
      body: Container(),
    );
  }
}

