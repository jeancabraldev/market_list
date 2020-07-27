import 'package:flutter/material.dart';
import 'package:market_list/widget/drawer/drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text('Lista de Supermercados'),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: const Center(
          child: Text('Home'),
        ),
      ),
    );
  }
}

