import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_list/screens/list/components/card_total.dart';
import 'package:market_list/screens/list/components/search_widget.dart';

import 'components/card_list_widget.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => SearchWidget(),
              );
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 180,
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.widgets),
                    title: const Text('Nome Produto'),
                    subtitle: const Text('1 Un x R\$ 0,00 = 0,00'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                ],
              ),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 20,
                    child: CardListWidget(
                      icon: Icons.list,
                      value: '100',
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: CardListWidget(
                      icon: Icons.shopping_cart,
                      value: '100',
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: CardListWidget(
                      icon: Icons.remove_shopping_cart,
                      value: '100',
                    ),
                  ),
                  Expanded(
                    flex: 40,
                    child: CardTotalWidget(
                      subTotal: 1010.00,
                      total: 1100.00,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}