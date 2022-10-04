import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class JokeModel {
  final String id;
  final String iconUrl;
  final String value;

  JokeModel({required this.id, required this.iconUrl, required this.value});

  JokeModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        iconUrl = json['icon_url'],
        value = json['value'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'icon_url': iconUrl, 'value': value};
}

Future<JokeModel> getJoke() async {
  const String uri = "https://api.chucknorris.io/jokes/random";
  try {
    final Response response = await Dio().get(uri);
    if (kDebugMode) {
      print(response.data);
    }
    return JokeModel.fromJson(response.data);
  } catch (e) {
    rethrow;
  }
}
