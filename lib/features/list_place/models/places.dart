import 'package:json_annotation/json_annotation.dart';

part 'places.g.dart';

@JsonSerializable()

/// данные из АПИ
class Places {
  final int id;
  final double lat;
  final double lng;
  final String name;
  final List<String> urls;
  final String placeType;
  final String description;

  Places({
    required this.id,
    required this.lat,
    required this.lng,
    required this.name,
    required this.urls,
    required this.placeType,
    required this.description,
  });

  /// взято из генератора
  factory Places.fromJson(Map<String, dynamic> json) => _$PlacesFromJson(json);

  /// взято из генератора
  Map<String, dynamic> toJson() => _$PlacesToJson(this);
}
