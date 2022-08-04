import 'package:json_annotation/json_annotation.dart';

import 'location_type.dart';
part 'location.g.dart';

@JsonSerializable()
class Location {
  final String title;
  @JsonKey(name: 'location_type')
  final LocationType locationType;
  @JsonKey(name: 'latt_long')
  @LatLngConverter()
  final LatLng latLng;
  final int woeid;

  const Location({
    required this.title,
    required this.locationType,
    required this.latLng,
    required this.woeid,
});

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);


  
}


class LatLng {
  final double latitude;
  final double longitude;

  const LatLng({required this.latitude, required this.longitude});

}

class LatLngConverter implements JsonConverter<LatLng, String> {
  const LatLngConverter();


  @override
  LatLng fromJson(String jsonString) {
    final parts = jsonString.split(',');
    return LatLng(
        latitude: double.parse(parts.first) ?? 0,
        longitude: double.parse(parts[1]) ?? 0);
  }

  @override
  String toJson(LatLng latLng) {
   return '${latLng.latitude}, ${latLng.longitude}';
  }
}

