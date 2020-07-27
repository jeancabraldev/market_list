import 'package:flutter/material.dart';
import 'package:market_list/widget/drawer/drawer_header.dart';

import 'drawer_tile.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeaderWidget(),
          DrawerTileWidget(
            icon: Icons.home,
            title: 'Início',
            page: 0,
          ),
          DrawerTileWidget(
            icon: Icons.info,
            title: 'Sobre',
            page: 1,
          ),
          DrawerTileWidget(
            icon: Icons.settings,
            title: 'Configurações',
            page: 2,
          ),
        ],
      ),
    );
  }
}
