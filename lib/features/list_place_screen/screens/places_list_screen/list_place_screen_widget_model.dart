import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_case/features/app/di/app_scope.dart';
import 'package:test_case/features/list_place/model/place.dart';
import 'package:test_case/features/list_place/service/api_service.dart';
import 'package:test_case/features/list_place_screen/screens/places_list_screen/list_place_screen.dart';
import 'package:test_case/features/list_place_screen/screens/places_list_screen/list_place_screen_model.dart';

/// Factory for [ListPlacesScreenWidgetModel].
ListPlacesScreenWidgetModel initScreenWidgetModelFactory(
  BuildContext context,
) {
  final model = ListPlacesScreenModel(PlaceApiService(
    context.read<IAppScope>().dio,
  ));
  return ListPlacesScreenWidgetModel(model);
}

/// Widget model for [ListPlacesScreen].
class ListPlacesScreenWidgetModel
    extends WidgetModel<ListPlacesScreen, ListPlacesScreenModel>
    implements ILisPlaceScreenWidgetModel {
  final EntityStateNotifier<List<Place>> _currentPlaceState =
      EntityStateNotifier();

  @override
  EntityStateNotifier<List<Place>> get listPlaces => _currentPlaceState;

  /// Create an instance [ListPlacesScreenWidgetModel].
  ListPlacesScreenWidgetModel(ListPlacesScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadListPlaces();
  }

  Future<void> _loadListPlaces() async {
    try {
      _currentPlaceState.loading();
      final allPlaces = await model.getListPlaces();
      _currentPlaceState.content(allPlaces);
    } on Exception catch (err) {
      if (err is DioError) {
        _currentPlaceState.error(err);
      }
    }
  }
}

/// Interface of [ListPlacesScreenWidgetModel].
abstract class ILisPlaceScreenWidgetModel extends IWidgetModel {
  /// список объектов из АПИ
  EntityStateNotifier<List<Place>> get listPlaces;
}
