import 'package:dio/dio.dart';
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
  Future<List<Place>> getNextPlaceItem() {
    try {
      return _getPlace(currentPage++);
    } on DioError catch (e) {
      handleError(e);
    }
    throw Exception();
  }

  /// загрузить все элементы из списка
  Future<List<Place>> _getPlace(int offset) async {
    return _placeApiService.fetchPlace(offset);
  }
}
