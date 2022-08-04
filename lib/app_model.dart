
import 'package:flutter/material.dart';

import 'api/model/location.dart';

class AppModel extends ChangeNotifier { // одна из частей elementary уведомление об изменениях
  Location? selectedLocation;
}