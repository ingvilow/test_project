import 'package:elementary/elementary.dart';
import 'package:test_case/features/list_place/model/place.dart';
import 'package:test_case/features/list_place/service/api_service.dart';
import 'package:test_case/features/temp/screens/temp_screen/list_place_screen.dart';

/// Model fol [ListPlaceScreen].
class ListPlaceScreenModel extends ElementaryModel {
  final PlaceApiService _placeApiService;
  int currentPage = 0;

  ListPlaceScreenModel(this._placeApiService);

  /// загрузить список заново
  Future<List<Place>> loadListPlaceAgain() async {
    currentPage = 0;
    return _getPlace(currentPage);
  }

  /// загрузить следующие элементы из списка
  Future<List<Place>> getNextPlaceItem() {
    return _getPlace(currentPage++);
  }

  /// загрузить все элементы из списка
  Future<List<Place>> _getPlace(int offset) async {
    return _placeApiService.fetchPlace(offset);
  }
}
