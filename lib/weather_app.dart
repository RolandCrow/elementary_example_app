
import 'package:flutter/material.dart';

import 'elementary/select_address_screen/select_address_screen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SelectAddressScreen(),
    );
  }

}