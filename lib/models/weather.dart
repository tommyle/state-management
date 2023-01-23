class Weather {
  final String temp;
  final String city;
  final String desc;
  final String icon;

  Weather.fromJson(Map<String, dynamic> json)
      : temp = json['main']['temp'].toString(),
        city = json['name'],
        icon = json['weather'][0]['icon'],
        desc = json['weather'][0]['description'];
}

extension WeatherViewModel on Weather {
  String get image {
    switch (icon) {
      case '02d':
      case '02n':
        return 'assets/sun-clouds.png';
      case '03d':
      case '03n':
      case '04d':
      case '04n':
      case '50d':
      case '50n':
        return 'assets/clouds.png';
      case '09d':
      case '09n':
      case '10d':
      case '10n':
        return 'assets/sun-clouds-rain.png';
      case '11d':
      case '11n':
        return 'assets/lightning.png';
      case '13d':
      case '13n':
        return 'assets/clouds-snow.png';
      case '01d':
      case '01n':
      default:
        return 'assets/sun.png';
    }
  }

  int? get degrees => double.tryParse(temp)?.round();
}
