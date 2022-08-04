

import 'package:elementary_example_app/elementary/select_address_screen/widget/highlighted_text.dart';
import 'package:flutter/material.dart';

import '../../../api/model/location.dart';

class LocationTile extends StatelessWidget { // выбор локации

  final Location location;
  final String requestString;
  final Function(Location)? onClick;

  const LocationTile({
    Key? key,
    required this.location,
    required this.requestString,
    this.onClick,
}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 40),
      title: HighlightedText(
          text: location.title,
          matcher: requestString),
      onTap: () {
        if(onClick != null) {
          onClick!(location);
        }
      },
    );

  }
  
  

}