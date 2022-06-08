import 'package:dio/dio.dart';
import 'package:test_case/features/list_place/models/place.dart';

/// класс для работы с запросами к АПИ
class PlaceApiService {
  final Dio dio;
  PlaceApiService(this.dio);

  /// выдает список всех имеющтхся мест, т.к их очень много, то пока выдает 15 штук
  Future<List<Place>> fetchPlaces() async {
    const offset = 2;
    final result = await dio.get<List>(
      '/place?count=2&offset=$offset',
    );
    if (result.data != null) {
      final jsonResponse = result.data as List;
      return jsonResponse
          .whereType<Map<String, Object?>>()
          .map(Place.fromJson)
          .toList();
    }
    throw Exception();
  }
}
