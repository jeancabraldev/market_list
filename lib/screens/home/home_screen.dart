import 'package:flutter/material.dart';
import 'package:market_list/screens/home/components/card_list_widget.dart';
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
                            if (_formKey.currentState.validate()) {}
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
          CardListWidget(),
        ],
      ),
    );
  }
}
