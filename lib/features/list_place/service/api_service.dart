import 'package:dio/dio.dart';
import 'package:test_case/features/list_place/model/place.dart';

/// класс для работы с запросами к АПИ
class PlaceApiService {
  final Dio dio;

  PlaceApiService(this.dio);

  /// выдает список имеющихся мест
  /// [offset] - необходим для реализации пагинации
  Future<List<Place>> fetchPlace(int offset) async {
    /// количество возвращаемых мест
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
