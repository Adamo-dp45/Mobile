import 'package:flutte/meteo/NestedNavigation.dart';
import 'package:flutte/meteo/WeatherDetailPage.dart';
import 'package:flutte/meteo/WeatherForm.dart';
import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget implements NestedNavigation {
  static final GlobalKey<NavigatorState> _navigationKey =
      GlobalKey<NavigatorState>();
  @override
  GlobalKey<NavigatorState> navigationKey() {
    return _navigationKey;
  } /*
    - Pour éviter que la touche retour sort de l'application.. doit retourner sur la vue précédente 
  */

  const new({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    switch (settings.name) {
      case 'weather/form':
        builder = (BuildContext context) => WeatherFormPage();
        break;
      case WeatherDetailPage.routeName: // O.. 'weather/result'
        builder = (BuildContext context) => WeatherDetailPage();
        break;
      default:
        throw Exception('Impossible de trouver la vue ${settings.name}');
    }
    return MaterialPageRoute(builder: builder, settings: settings);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigationKey(), // !!

      initialRoute: 'weather/form',
      onGenerateRoute: _onGenerateRoute /*
        - Pour naviguer dans les sous pages sans perdre la 'BottomNavigationBar'
      */,
    );
  }
}
