import 'package:json_annotation/json_annotation.dart';

part 'place.g.dart';

/// данные из АПИ

@JsonSerializable()
class Place {
  final int id;
  final double lat;
  final double lng;
  final String name;
  final List<String> urls;
  final String placeType;
  final String description;

  Place({
    required this.id,
    required this.lat,
    required this.lng,
    required this.name,
    required this.urls,
    required this.placeType,
    required this.description,
  });

  /// взято из сгенерированного файла places.g.dart после сериализации объектов
  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  /// взято из сгенерированного файла places.g.dart после сериализации объектов
  Map<String, dynamic> toJson() => _$PlaceToJson(this);
}
