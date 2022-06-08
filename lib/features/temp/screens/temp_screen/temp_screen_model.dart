import 'package:elementary/elementary.dart';
import 'package:test_case/features/list_place/models/place.dart';
import 'package:test_case/features/list_place/services/api_service.dart';
import 'package:test_case/features/temp/screens/temp_screen/temp_screen.dart';

/// Model fol [TempScreen].
class TempScreenModel extends ElementaryModel {
  final ApiService apiService;
  TempScreenModel(this.apiService);

  Future<List<Place>> getPlace() async {
    return apiService.fetchPlaces();
  }
}
