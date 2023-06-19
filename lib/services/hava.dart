import 'dart:io';

import 'package:fruk/models/havadurumu_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Hava> fetchHava() async {
  final response = await http.get(
      Uri.parse(
          "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=balikesir"),
      headers: {
        HttpHeaders.authorizationHeader:
            'apikey 4b5B3z4kkdFKIFwSYcqrmf:5cSGuT6j39oGuYCJ6gjaZd',
        HttpHeaders.contentTypeHeader: 'application/json'
      });

  if (response.statusCode == 200) {
    return Hava.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Yüklenemedi');
  }
}
