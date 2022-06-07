import 'dart:convert' as convert;

import 'package:dio/dio.dart';
import 'package:test_case/assets/strings/strings.dart';
import 'package:test_case/config/urls.dart';
import 'package:test_case/features/list_place/models/places.dart';

/// класс для работы с запросами к АПИ
class ApiService {
  /// выдает список всех имеющтхся мест, т.к их очень много, то пока выдает 15 штук
  Future<List<Places>> fetchPlaces() async {
    final result =
        await Dio().get<List<Places>>('${Url.devUrl}/place?count=15');
    final jsonResponse = convert.jsonDecode(result.data.toString()) as List;
    if (result.statusCode == 200) {
      return jsonResponse
          .whereType<Map<String, Object?>>()
          .map(Places.fromJson)
          .toList();
    }
    if (result.statusCode == 404) {
      throw Exception(Strings.notFound);
    } else if (result.statusCode == 502) {
      throw Exception(Strings.badGateway);
    }
    throw Exception();
  }
}
