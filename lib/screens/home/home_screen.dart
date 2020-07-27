import 'package:flutter/material.dart';
import 'package:market_list/models/preference/preference_manager.dart';
import 'package:provider/provider.dart';
import 'package:market_list/widget/drawer/drawer.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  String validatorList(String list) {
    if (list.isEmpty) {
      return 'Campo Obriatório';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeDark = context.watch<PreferenceManager>();
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text('Lista'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Nova Lista',
                        textAlign: TextAlign.center,
                      ),
                      content: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: ListBody(
                            children: <Widget>[
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Nome da Lista',
                                ),
                                controller: _controller,
                                validator: validatorList,
                                autofocus: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'Cancelar',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {

                            }
                          },
                          child: const Text('Criar Lista'),
                        ),
                      ],
                    );
                  });
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      // ignore: avoid_unnecessary_containers
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  if (themeDark.dark)
                    Image.asset(
                      'assets/images/cart_dark.png',
                      width: 50,
                      height: 50,
                    )
                  else
                    Image.asset(
                      'assets/images/cart.png',
                      width: 50,
                      height: 50,
                    ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text('Nome da Lista'),
                      Text(
                        '(0 itens) - 26/07/20',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 118),
                  Icon(
                    Icons.more_vert,
                    color: themeDark.dark ? Colors.white : Colors.grey[700],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
