

import 'package:elementary_example_app/api/model/weather.dart';
import 'package:elementary_example_app/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherForecastTile extends StatelessWidget {
    final int position;
    final Weather weather;

    const WeatherForecastTile({
      Key? key,
      required this.position,
      required this.weather,
}): super(key: key);





  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 25,),
        Text(
          position == 0
              ? 'Today'
              : DateFormat('EEEE').format(weather.applicableDate),
          style: AppTypography.body.copyWith(color: Colors.black45),
        ),
        const Spacer(),
        Text(
          weather.weatherStateName,
          style: AppTypography.body.copyWith(color: Colors.black45),
        ),
        const SizedBox(width: 20,),
        Text(
          '${weather.maxTemp.round().toString()}°',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 20,),
        SvgPicture.asset(
          'assets/weather/${weather.weatherStateAbbr.abbr}.svg',
          height: 24,
          width: 24,
        ),
        const SizedBox(width: 25,)
      ],
    );
  }

}