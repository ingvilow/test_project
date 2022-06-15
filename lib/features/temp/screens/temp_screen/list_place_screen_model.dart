import 'package:elementary/elementary.dart';
import 'package:test_case/features/list_place/model/place.dart';
import 'package:test_case/features/list_place/service/api_service.dart';
import 'package:test_case/features/temp/screens/temp_screen/list_place_screen.dart';

/// Model fol [ListPlaceScreen].
class ListPlaceScreenModel extends ElementaryModel {
  final PlaceApiService _placeApiService;
  int currentPage = 0;

  ListPlaceScreenModel(this._placeApiService);

  /// загрузить все элементы из списка
  Future<List<Place>> getPlace(int offset) async {
    return _placeApiService.fetchPlace(offset);
  }

  /// загрузить список заново
  Future<List<Place>> loadListPlaceAgain() async {
    return getPlace(currentPage);
  }

  /// загрузить следующие элементы из списка
  Future<List<Place>> getNextPlaceItem() {
    return getPlace(currentPage + 15);
  }
}
