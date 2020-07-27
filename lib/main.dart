import 'package:flutter/material.dart';
import 'package:market_list/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:market_list/screens/base/base_screen.dart';
import 'package:market_list/screens/base/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/preference/preference_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(preferences: sharedPreferences));
}

class MyApp extends StatefulWidget {
  final SharedPreferences preferences;

  const MyApp({Key key, @required this.preferences})
      : assert(preferences != null),
        super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PreferenceManager _preferencesManager;

  @override
  void initState() {
    _preferencesManager = PreferenceManager(widget.preferences);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<PreferenceManager>.value(
      value: _preferencesManager,
      child: StreamBuilder(
        initialData: _preferencesManager,
        stream: _preferencesManager.stream,
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'Market List',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: ColorsApp.primaryColorLight(),
              accentColor: ColorsApp.primaryColorLight(),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              fontFamily: 'Montserrat',
              textTheme: TextTheme(
                bodyText2: TextStyle(fontSize: 20, color: Colors.grey[700]),
              ),
              appBarTheme: const AppBarTheme(
                elevation: 0,
              ),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: ColorsApp.primaryColorDark(),
              accentColor: ColorsApp.primaryColorDark(),
              scaffoldBackgroundColor: ColorsApp.backgroundColorDark(),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              fontFamily: 'Montserrat',
              textTheme: const TextTheme(
                bodyText2: TextStyle(fontSize: 20),
              ),
              appBarTheme: const AppBarTheme(
                elevation: 0,
              ),
            ),
            themeMode:
                _preferencesManager.dark ? ThemeMode.dark : ThemeMode.light,
            initialRoute: Routes.baseScreen,
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case Routes.baseScreen:
                default:
                  return MaterialPageRoute(
                    builder: (_) => BaseScreen(),
                  );
              }
            },
          );
        },
      ),
    );
  }
}
