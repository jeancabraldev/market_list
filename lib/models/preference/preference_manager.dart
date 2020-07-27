import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  PreferenceManager(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static final StreamController<PreferenceManager> _streamController =
      StreamController.broadcast();

  final Stream<PreferenceManager> stream = _streamController.stream;

  final _darkTheme = 'darkTheme';

  // ignore: avoid_positional_boolean_parameters
  Future setDarkTheme(bool value) async {
    await _sharedPreferences.setBool(_darkTheme, value);
    _streamController.add(this);
  }

  bool get dark {
    return _sharedPreferences.getBool(_darkTheme) ?? false;
  }
}
