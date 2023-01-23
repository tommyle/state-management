import 'package:flutter/material.dart';
import 'package:state_management/models/weather.dart';
import 'package:state_management/services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  final WeatherService _weatherService = WeatherService();
  Weather? weather;

  void fetchWeather({required String city}) async {
    weather = await _weatherService.getWeather(city: city);
    notifyListeners();
  }
}
