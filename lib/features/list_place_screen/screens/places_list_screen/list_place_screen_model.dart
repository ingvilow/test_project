import 'package:elementary/elementary.dart';
import 'package:test_case/features/list_place/model/place.dart';
import 'package:test_case/features/list_place/service/api_service.dart';

class ListPlacesScreenModel extends ElementaryModel {
  final PlaceApiService _placeApiService;
  int currentPage = 0;

  ListPlacesScreenModel(this._placeApiService);

  /// загрузить список заново
  Future<List<Place>> loadListPlaceAgain() async {
    currentPage = 0;
    return _getPlace(currentPage);
  }

  /// загрузить следующие элементы из списка
  Future<List<Place>> getNextPlaceItem() async {
    return _getPlace(currentPage);
  }

  /// загрузить все элементы из списка
  Future<List<Place>> _getPlace(int offset) async {
    final value = await _placeApiService.fetchPlace(offset);
    currentPage++;
    return value;
  }
}
