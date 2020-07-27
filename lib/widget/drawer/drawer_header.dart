import 'package:flutter/material.dart';
import 'package:market_list/models/preference/preference_manager.dart';
import 'package:market_list/utils/colors.dart';
import 'package:provider/provider.dart';

class DrawerHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeDark = context.watch<PreferenceManager>();
    // ignore: avoid_unnecessary_containers
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      color: themeDark.dark ? ColorsApp.primaryColorDark() : Colors.grey[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (themeDark.dark) Image.asset(
                  'assets/images/cart_dark.png',
                  width: 100,
                  height: 100,
                ) else Image.asset(
                  'assets/images/cart.png',
                  width: 100,
                  height: 100,
                ),
          const Text(
            'Lista de Supermercados',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
