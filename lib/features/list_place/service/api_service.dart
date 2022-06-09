import 'package:dio/dio.dart';
import 'package:test_case/features/list_place/model/place.dart';

/// класс для работы с запросами к АПИ
class PlaceApiService {
  /// выдает список всех имеющтхся мест, т.к их очень много, то пока выдает 15 штук
  /// offset - необходим для реализации пагинации
  Future<List<Place>> fetchPlace(int offset) async {
    final result = await Dio().get<List>('/place?count=15&offset=$offset');
    if (result.data != null) {
      final jsonResponse = result.data.toString as List;
      return jsonResponse
          .whereType<Map<String, Object?>>()
          .map(Place.fromJson)
          .toList();
    }
    throw Exception();
  }
}
