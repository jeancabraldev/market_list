import 'package:flutter/material.dart';
import 'package:market_list/models/preference/preference_manager.dart';
import 'package:provider/provider.dart';
import 'package:market_list/utils/colors.dart';

class CardListWidget extends StatelessWidget {
  const CardListWidget({this.icon, this.value});

  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    final themeDark = context.watch<PreferenceManager>();
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 21),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: themeDark.dark
                  ? Colors.white
                  : ColorsApp.primaryColorIconLight(),
            ),
            const SizedBox(height: 5),
            Text(value),
          ],
        ),
      ),
    );
  }
}
