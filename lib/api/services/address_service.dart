
import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:elementary_example_app/api/model/location.dart';

const baseUrl = 'https://www.metaweather.com';

class AddressService {

  final dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<List<Location>> getCityPrediction(String query) async {
    final locationResponse = await dio.get<String>( // получаем список городов
      '/api/location/search/?query=$query',
    );

    final locationJson = jsonDecode(locationResponse.data ?? "") as List; // разбираем полученные данные

    final result = <Location>[];
    for(final location in locationJson){
      result.add(Location.fromJson(location as Map<String, dynamic>)); // добавляем значения в цикле

    }

    return result;


  }


}

