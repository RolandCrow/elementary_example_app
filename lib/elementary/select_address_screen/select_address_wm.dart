import 'package:elementary/elementary.dart';
import 'package:elementary_example_app/api/model/location.dart';
import 'package:elementary_example_app/api/services/navigation_hepler.dart';
import 'package:elementary_example_app/elementary/select_address_screen/select_address_model.dart';
import 'package:elementary_example_app/elementary/select_address_screen/select_address_screen.dart';
import 'package:elementary_example_app/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../api/services/address_service.dart';
import '../../app_model.dart';
import '../weather_details_screen/weather_screen.dart';


class SelectAddressWM extends WidgetModel<SelectAddressScreen, SelectAddressModel> implements ISelectedAddress { // view model слой в архитектуре MVVM
    final NavigationHelper _navigator; // помощь в навигации из services
    final TextEditingController _searchFieldController = TextEditingController(); // контроль за введенным текстом

    @override
  ValueListenable<List<Location>> get predictions => model.predictions;

    @override
  TextEditingController get searchFieldController => _searchFieldController;

    SelectAddressWM(SelectAddressModel model, this._navigator): super(model);

    @override
    void initWidgetModel() {
      super.initWidgetModel();
      searchFieldController.addListener(_onTextChanged);
    }
   
    @override
  void dispose() { // закрываем контроллер 
      _searchFieldController
      ..removeListener(_onTextChanged)
      ..dispose();
      
      super.dispose();
  }
  
  
  
  void _onTextChanged() {
      model.getCityPrediction(searchFieldController.text); // функция следит за изменением текста

  }

    @override
  void onTapLocation(Location e) { // если нажать на локацию то проваливаешься дальше
      model.onLocationSelected(e);
      _navigator.push(context,
        MaterialPageRoute<void>(builder:
        (_) => const WeatherScreen(),
        ),
      );
    }

 
}





abstract class ISelectedAddress extends IWidgetModel { // информация о выбранном которая передается дальше
  TextEditingController get searchFieldController;
  ValueListenable<List<Location>> get predictions;
  void onTapLocation(Location e);
}

SelectAddressWM createSelectedAddressWM(BuildContext _) => SelectAddressWM(
  SelectAddressModel(
    AddressService(),
    getIt<AppModel>(), // инъекция зависимостей
  ),
  NavigationHelper(),

);
