import 'package:elementary/elementary.dart';
import 'package:test_case/features/list_place/model/place.dart';
import 'package:test_case/features/list_place/service/api_service.dart';
import 'package:test_case/features/temp/screens/temp_screen/temp_screen.dart';

/// Model fol [ListPlaceScreen].
class ListPlaceScreenModel extends ElementaryModel {
  final PlaceApiService _placeApiService;

  ListPlaceScreenModel(this._placeApiService);

  Future<List<Place>> getPlace(int offset) async {
    return _placeApiService.fetchPlace(offset);
  }
}
