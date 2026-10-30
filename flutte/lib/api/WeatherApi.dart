import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class WeatherApi {
  Future<WeatherForecast> fetch(String city) async {
    final response = await Client().get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast/daily?q=${Uri.encodeComponent(city)}mode=json..',
      ), // https://jsonplaceholder.typicode.com/posts
      /*
        {
          "userId": 1,
          "id": 2,
          "title": "qui est esse",
          "body": "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
        },
      */
    );
    return compute(parseWeather, response.body);
  }

  WeatherForecast parseWeather(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<String, dynamic>();
    return WeatherForecast.fromJson(parsed);
  }
}

class WeatherForecast {
  final List<WeatherForecastItem> days;
  final String city;

  WeatherForecast({required this.days, required this.city});

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    return WeatherForecast(
      city: json['city']['name'],
      days: (json['list'] as List<dynamic>)
          .map((e) => WeatherForecastItem.fromJson(e))
          .toList(),
    );
  }
}

class WeatherForecastItem {
  final double temperature;
  final int timestamp;
  final String icon;

  WeatherForecastItem({
    this.temperature = 0.0,
    this.timestamp = 0,
    this.icon = '',
  });

  factory WeatherForecastItem.fromJson(Map<String, dynamic> json) {
    return WeatherForecastItem(
      temperature: json['temp']['day'],
      timestamp: json['dt'],
      icon: _getIcon(json['weather'][0]['main']),
    );
  }

  static String _getIcon(String icon) {
    switch (icon) {
      case 'Clouds':
        return 'cloudy';
      case 'Rain':
        return 'rain';
      default:
        return 'sun';
    }
  }
}
