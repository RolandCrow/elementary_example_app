import 'package:elementary/elementary.dart';
import 'package:elementary_example_app/api/model/location.dart';
import 'package:elementary_example_app/api/services/address_service.dart';
import 'package:elementary_example_app/app_model.dart';
import 'package:flutter/material.dart';


class SelectAddressModel extends ElementaryModel { // класс модели в mvvm


  final ValueNotifier<List<Location>> predictions = ValueNotifier([]);
  final AddressService _addressService;
  final AppModel _appModel;

  SelectAddressModel(this._addressService, this._appModel);

  void onLocationSelected(Location location) {
    _appModel.selectedLocation = location;
  }

  Future<void> getCityPrediction(String text) async { // передаем найденный город
    final value = await _addressService.getCityPrediction(text);
    predictions.value = value;
  }

}