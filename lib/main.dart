import 'package:elementary_example_app/app_model.dart';
import 'package:elementary_example_app/weather_app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance; // инъекция зависимостей для flutter

void main() {
  getIt.registerSingleton<AppModel>(AppModel(), signalsReady: true); // регистрируем синглтон
  runApp(const WeatherApp());
}
