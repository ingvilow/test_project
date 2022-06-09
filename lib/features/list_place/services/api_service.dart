import 'package:dio/dio.dart';
import 'package:test_case/features/list_place/models/places.dart';

/// класс для работы с запросами к АПИ
class ApiService {
  /// выдает список всех имеющтхся мест, т.к их очень много, то пока выдает 15 штук
  /// offset - необходим для реализации пагинации
  Future<List<Places>> fetchPlaces(int offset) async {
    final result = await Dio().get<List>('/place?count=15&offset=$offset');
    if (result.data != null) {
      final jsonResponse = result.data.toString as List;
      return jsonResponse
          .whereType<Map<String, Object?>>()
          .map(Places.fromJson)
          .toList();
    }
    throw Exception();
  }
}
