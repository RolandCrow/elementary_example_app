
import 'package:elementary/elementary.dart';
import 'package:elementary_example_app/api/model/location.dart';
import 'package:elementary_example_app/elementary/select_address_screen/select_address_wm.dart';
import 'package:elementary_example_app/elementary/select_address_screen/widget/location_tile.dart';
import 'package:elementary_example_app/elementary/select_address_screen/widget/search_text_field.dart';
import 'package:elementary_example_app/theme/app_typography.dart';
import 'package:flutter/material.dart';


class SelectAddressScreen extends ElementaryWidget<ISelectedAddress> {// слой вью в mvvm
    const SelectAddressScreen({
   Key? key,
      WidgetModelFactory wmFactory = createSelectedAddressWM, // фабрика из VM
}): super(wmFactory, key: key);

  @override
  Widget build(ISelectedAddress wm) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const SizedBox(height: 80,),
           Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text('Weather',style: AppTypography.header,),
           ),
          const SizedBox(height: 30,),
          SearchTextField(controller: wm.searchFieldController,),
          Expanded(
              child: ValueListenableBuilder<List<Location>>(
                valueListenable: wm.predictions,
                builder: (_, data, __) {
                  return data.isEmpty
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Please change searching request',
                        style: AppTypography.body,
                      )
                    ],
                  )
                      :SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for(final location in data)
                          LocationTile(
                            location: location,
                            requestString: wm.searchFieldController.text,
                            onClick: wm.onTapLocation,
                          )

                      ],
                    ),
                  );
                },
              )
          )


        ],
      ),
    );
  }
    

}