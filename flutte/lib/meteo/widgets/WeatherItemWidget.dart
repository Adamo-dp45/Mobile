import 'package:flutte/Theme.dart';
import 'package:flutte/api/WeatherApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class WeatherItemWidget extends StatelessWidget {
  WeatherForecastItem day;

  WeatherItemWidget({required this.day});

  @override
  Widget build(BuildContext context) {
    final dayOfWeek = toBeginningOfSentenceCase(
      DateFormat.E(Localizations.localeOf(context).toString())
          .format(DateTime.fromMillisecondsSinceEpoch(day.timestamp * 1000)),
    )!; /*
          - '!' pour indiquer que ça existe forcement
        */
    final date = DateFormat.Md(Localizations.localeOf(context).toString())
        .format(DateTime.fromMillisecondsSinceEpoch(day.timestamp * 1000));
    final textStyle = Theme.of(context).textTheme.headlineMedium!
        .copyWith(color: Colors.white);

    return SizedBox(
      height: 80,
      child: Container(
        // color: MyThemeColors.grey, -- Vu qu'on ne peut pas avoir une couleur et une décoration en même temps
        decoration: BoxDecoration(
          color: MyThemeColors.grey,
          borderRadius: BorderRadius.circular(8),
          border: Border(
            bottom: BorderSide(width: 1, color: MyThemeColors.greyDark),
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image(image: AssetImage('assets/${day.icon}.png')),
            SizedBox(height: 8),
            Text(dayOfWeek, style: textStyle),
            SizedBox(height: 8),
            Text(date, style: textStyle.copyWith(color: MyThemeColors.grey)),
            Spacer(flex: 1),
            Text(
              '${day.temperature.toStringAsFixed(0)}°C' /*
                - Pour avoir la température en '°C' sans décimales
              */,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
