

import 'package:flutter/material.dart';

class NavigationHelper { // помощь в навигации
  void push(BuildContext context, Route<void> route) {
    Navigator.of(context).push(route);
  }

}