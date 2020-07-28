import 'package:flutter/material.dart';
import 'package:market_list/models/preference/preference_manager.dart';
import 'package:provider/provider.dart';

class CardListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeDark = context.watch<PreferenceManager>();
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/list'),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: ListTile(
          leading: themeDark.dark
              ? Image.asset(
                  'assets/images/cart_dark.png',
                  width: 50,
                  height: 50,
                )
              : Image.asset(
                  'assets/images/cart.png',
                  width: 50,
                  height: 50,
                ),
          title: const Text('Nome da Lista'),
          subtitle: const Text('(0 itens) - 26/07/20'),
          trailing: Icon(Icons.more_vert),
          onTap: () => Navigator.of(context).pushNamed('/list'),
        ),
      ),
    );
  }
}
