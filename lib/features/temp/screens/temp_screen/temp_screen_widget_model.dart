import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_case/features/app/di/app_scope.dart';
import 'package:test_case/features/list_place/model/place.dart';
import 'package:test_case/features/list_place/service/api_service.dart';
import 'package:test_case/features/temp/screens/temp_screen/temp_screen.dart';
import 'package:test_case/features/temp/screens/temp_screen/temp_screen_model.dart';

/// Factory for [ListPlacesScreenWidgetModel].
ListPlacesScreenWidgetModel initScreenWidgetModelFactory(
  BuildContext context,
) {
  final model =
      ListPlacesScreenModel(PlaceApiService(context.read<IAppScope>().dio));
  return ListPlacesScreenWidgetModel(model);
}

/// Widget model for [ListPlacesScreen].
class ListPlacesScreenWidgetModel
    extends WidgetModel<ListPlacesScreen, ListPlacesScreenModel>
    implements IScreenWidgetModel {
  /// Create an instance [ListPlacesScreenWidgetModel].
  final EntityStateNotifier<List<Place>> _currentPlaceState =
      EntityStateNotifier(null);

  @override
  EntityStateNotifier<List<Place>> get listPlaces => _currentPlaceState;

  ListPlacesScreenWidgetModel(ListPlacesScreenModel model) : super(model);

  Future loadListPlaces() async {
    const offset = 1;
    try {
      _currentPlaceState.loading();
      final allPlaces = await model.getListPlaces(offset);
      _currentPlaceState.content(allPlaces);
    } on Exception catch (err) {
      if (err is DioError) {
        _currentPlaceState.error();
      }
    }
  }
}

/// Interface of [ListPlacesScreenWidgetModel].
abstract class IScreenWidgetModel extends IWidgetModel {
  /// список объектов из АПИ
  EntityStateNotifier<List<Place>> get listPlaces;
}
