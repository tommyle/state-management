class Weather {
  final String temp;
  final String city;
  final String desc;

  Weather.fromJson(Map<String, dynamic> json)
      : temp = json['main']['temp'].toString(),
        city = json['name'],
        desc = json['weather'][0]['description'];
}

extension WeatherImage on Weather {
  String get image {
    switch (desc) {
      case 'few clouds':
        return 'assets/sun-clouds.png';
      case 'mist':
      case 'broken clouds':
      case 'scattered clouds':
        return 'assets/clouds.png';
      case 'shower rain':
      case 'rain':
        return 'assets/sun-clouds-rain.png';
      case 'thunderstorm':
        return 'assets/lightning.png';
      case 'snow':
        return 'assets/clouds-snow.png';
      case 'clear sky':
      default:
        return 'assets/sun.png';
    }
  }
}
