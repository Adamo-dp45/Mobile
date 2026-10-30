import 'package:flutte/api/WeatherApi.dart';
import 'package:flutte/meteo/widgets/WeatherItemBigWidget.dart';
import 'package:flutte/meteo/widgets/WeatherItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherDetailPage extends StatelessWidget {
  static const routeName = 'weather/detail';

  @override
  Widget build(BuildContext context) {
    final forecast =
        ModalRoute.of(context)!.settings.arguments as WeatherForecast; /*
      - On récupère les données qu'on a passées dans 'ForecastArguments' puis 'args.forecast'
    */

    return Scaffold(
      appBar: AppBar(
        title: Text('Météo à ${forecast.city}'),
      ), // La température est de '${args.forecast.days[0].temperature}°C'
      body: ListView(
        // On peut l'animé via AnimatedList
        children: forecast.days.asMap().entries.map((e) {
          if (e.key == 0) {
            return WeatherItemBigWidget(day: e.value);
          } else {
            return WeatherItemWidget(day: e.value);
          }
        }).toList(),
        /*
          children: forecast.days
            .map((day) => WeatherItemWidget(day: day))
            .toList(),
        */
      ),
    );
  }
} /*
  - Dans 'WeatherPage' on va naviguer vers cette page en passant les données qu'on a récupérées dans 'ForecastArguments'
*/
