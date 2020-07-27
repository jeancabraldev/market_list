import 'package:flutter/material.dart';
import 'package:market_list/models/preference/preference_manager.dart';
import 'package:provider/provider.dart';
import 'package:market_list/widget/drawer/drawer.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeDark = context.watch<PreferenceManager>();
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: _settings(context, themeDark),
    );
  }

  ListView _settings(BuildContext context, PreferenceManager themeDark) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 5,
              child: themeDark.dark
                  ? Icon(Icons.brightness_4)
                  : Icon(Icons.brightness_high, color: Colors.grey[700]),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 72,
              child: SwitchListTile(
                title: Text(
                  'Tema',
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
                onChanged: (value) => themeDark.setDarkTheme(value),
                value: themeDark.dark,
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
