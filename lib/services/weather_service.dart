import 'package:dio/dio.dart';
import 'package:state_management/models/weather.dart';

class WeatherService {
  final _dio = Dio();
  static const String _apiKey = "1fdebf00ecb901e7dc690d55ed611c88";

  Future<Weather?> getWeather({required String city}) async {
    Weather? weather;
    try {
      final response = await _dio.get(
          "https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$_apiKey");
      weather = Weather.fromJson(response.data);
    } catch (e) {
      print(e);
    }
    return weather;
  }
}
