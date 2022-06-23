import 'package:elementary/elementary.dart';
import 'package:test_case/features/list_place/model/place.dart';
import 'package:test_case/features/list_place/service/api_service.dart';
import 'package:test_case/features/temp/screens/temp_screen/temp_screen.dart';

/// Model fol [ListPlacesScreen].
class ListPlacesScreenModel extends ElementaryModel {
  final PlaceApiService _apiService;

  ListPlacesScreenModel(this._apiService);

  /// получить список всех мест из АПИ
  Future<List<Place>> getListPlaces(int offset) {
    return _apiService.fetchPlace(offset);
  }
}
