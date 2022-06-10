import 'package:dio/dio.dart';
import 'package:test_case/features/list_place/model/place.dart';

/// класс для работы с запросами к АПИ
class PlaceApiService {
  final Dio dio;

  PlaceApiService(this.dio);

  /// offset - необходим для реализации пагинации
  Future<List<Place>> fetchPlace(int offset) async {
    /// выдает список всех имеющтхся мест, т.к их очень много, то пока выдает 15 штук
    const count = 15;

    final result = await Dio().get<List>('/place?count=$count&offset=$offset');
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
