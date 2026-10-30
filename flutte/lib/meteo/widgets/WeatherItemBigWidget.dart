import 'package:flutte/Theme.dart';
import 'package:flutte/api/WeatherApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class WeatherItemBigWidget extends StatelessWidget {
  WeatherForecastItem day;

  WeatherItemBigWidget({required this.day});

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
      height: 130,
      child: Container(
        // color: MyThemeColors.grey, -- Vu qu'on ne peut pas avoir une couleur et une décoration en même temps
        decoration: BoxDecoration(
          color: MyThemeColors.redLight,
          borderRadius: BorderRadius.circular(8),
          border: Border(
            bottom: BorderSide(width: 1, color: MyThemeColors.greyDark),
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(dayOfWeek, style: textStyle),
                    SizedBox(height: 8),
                    Text(
                      date,
                      style: textStyle.copyWith(color: MyThemeColors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Image(
                  image: AssetImage('assets/${day.icon}.png'),
                  width: 70,
                  height: 70,
                ),
              ],
            ),
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
