import 'package:flutter/material.dart';
import 'package:map/screens/onboarding.dart';
import 'package:map/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:map/utilties/app_theme.dart';


main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Widget screen;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('seen');
  if (seen == null || seen == false)
  {

    screen = OnBoarding();

  }
  else
  {

    screen = HomeScreen();

  }

  runApp( NewsApp(screen));

}


class NewsApp extends StatelessWidget
{


  final Widget _screen;


  NewsApp(this._screen);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: this._screen,
    );
  }

}