// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:state_management/services/weather_service.dart';

void main() {
  test('Counter value should be incremented', () async {
    final weatherService = WeatherService();
    final response = await weatherService.getWeather(city: 'Vancouver');
    print(response);
  });
}
