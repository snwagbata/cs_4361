class Weather {
  final String time;
  final double temperature;

  Weather({required this.time, required this.temperature});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      time: json['current']['time'],
      temperature: json['current']['temperature_2m'].toDouble(),
    );
  }

  String get getTime => time;
  double get getTemperature => temperature;

  @override
  String toString() {
    return 'Weather(time: $time, temperature: $temperature)';
  }
}
