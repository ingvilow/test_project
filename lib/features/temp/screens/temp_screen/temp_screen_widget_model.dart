import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_case/features/app/di/app_scope.dart';
import 'package:test_case/features/list_place/models/place.dart';
import 'package:test_case/features/list_place/services/api_service.dart';
import 'package:test_case/features/temp/screens/temp_screen/temp_screen.dart';
import 'package:test_case/features/temp/screens/temp_screen/temp_screen_model.dart';

/// Factory for [TempScreenWidgetModel].
TempScreenWidgetModel initScreenWidgetModelFactory(
  BuildContext context,
) {
  final model =
      TempScreenModel(PlaceApiService(Provider.of<AppScope>(context).dio));
  return TempScreenWidgetModel(model);
}

/// Widget model for [TempScreen].
class TempScreenWidgetModel extends WidgetModel<TempScreen, TempScreenModel>
    implements IDebugWidgetModel {
  final EntityStateNotifier<List<Place>> _currentPlaceState =
      EntityStateNotifier(null);

  @override
  ListenableState<EntityState<List<Place>>> get placeList => _currentPlaceState;

  /// Create an instance [TempScreenWidgetModel].
  TempScreenWidgetModel(TempScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    _loadPlaces();
    super.initWidgetModel();
  }

  Future _loadPlaces() async {
    try {
      _currentPlaceState.loading();
      final places = await model.getPlace();
      _currentPlaceState.content(places);
    } on Exception catch (err) {
      _currentPlaceState.error(err);
    }
  }
}

/// Interface of [TempScreenWidgetModel].
abstract class IDebugWidgetModel extends IWidgetModel {
  ListenableState<EntityState<List<Place>>> get placeList;
}
