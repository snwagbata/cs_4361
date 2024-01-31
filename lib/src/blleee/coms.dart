import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs_4361/src/blleee/Weather.dart';
import 'package:http/http.dart' as http;

class Coms {
  static Future<Weather> getWeather(String url) async {
    final response = await http.get(Uri.parse(url));
    FirebaseFirestore.instance.collection('weather').add({
      'time': DateTime.now(),
      'temperature': jsonDecode(response.body)['current']['temperature_2m'],
    });
    return Weather.fromJson(jsonDecode(response.body));
  }
}
