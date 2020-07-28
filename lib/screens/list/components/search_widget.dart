import 'package:flutter/material.dart';
import 'package:market_list/models/preference/preference_manager.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeDark = context.watch<PreferenceManager>();
    return Stack(
      children: <Widget>[
        Positioned(
          top: 2,
          left: 5,
          right: 5,
          child: Card(
            child: TextFormField(
              textInputAction: TextInputAction.search,
              autofocus: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                prefixIcon: IconButton(
                  icon: Icon(Icons.arrow_back,
                    color: themeDark.dark ? Colors.white : null,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
