import 'package:elementary/elementary.dart';
import 'package:test_case/features/list_place/model/place.dart';
import 'package:test_case/features/list_place/service/api_service.dart';

class ListPlacesScreenModel extends ElementaryModel {
  final PlaceApiService _apiService;

  ListPlacesScreenModel(this._apiService);

  /// получить список всех мест из АПИ
  Future<List<Place>> getListPlaces() {
    const offset = 0;
    return _apiService.fetchPlace(offset);
  }
}
