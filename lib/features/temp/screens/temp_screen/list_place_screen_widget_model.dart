import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_case/features/app/di/app_scope.dart';
import 'package:test_case/features/list_place/model/place.dart';
import 'package:test_case/features/list_place/service/api_service.dart';
import 'package:test_case/features/temp/screens/temp_screen/list_place_screen.dart';
import 'package:test_case/features/temp/screens/temp_screen/list_place_screen_model.dart';
import 'package:test_case/features/temp/screens/temp_screen/ui/snackbar_ui.dart';
import 'package:test_case/features/temp/screens/temp_screen/ui/utils/controller_dialog.dart';

/// Factory for [ListPlaceScreenWidgetModel].
ListPlaceScreenWidgetModel initScreenWidgetModelFactory(
  BuildContext context,
) {
  final model = ListPlaceScreenModel(
    PlaceApiService(context.read<IAppScope>().dio),
  );
  return ListPlaceScreenWidgetModel(model, DialogController(context));
}

/// Widget model for [ListPlaceScreen].
class ListPlaceScreenWidgetModel
    extends WidgetModel<ListPlaceScreen, ListPlaceScreenModel>
    implements IDebugWidgetModel {
  final ScrollController scrollController = ScrollController();
  final DialogController _dialogController;
  final EntityStateNotifier<List<Place>> _currentPlaceState =
      EntityStateNotifier(null);

  @override
  ListenableState<EntityState<List<Place>>> get placeList => _currentPlaceState;

  /// Create an instance [ListPlaceScreenWidgetModel].
  ListPlaceScreenWidgetModel(
    ListPlaceScreenModel model,
    this._dialogController,
  ) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    scrollController.addListener(_onScroll);
    onRefresh();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  /// полная перезагрузка страницы  при ошибке
  @override
  void reloadPlaces() => _loadPlaces();

  /// обновление страницы без полной перезагрузки
  @override
  Future<void> onRefresh() async {
    try {
      _currentPlaceState.loading();
      await Future<void>.delayed(const Duration(seconds: 2));
      final retryValue = await model.loadListPlaceAgain();
      _currentPlaceState.content(retryValue);
    } on Exception {
      _dialogController.showSnackBar(const TagBar());
      await model.loadListPlaceAgain();
    }
  }

  /// управляет пагинацей списка: первые 15 значений загружаются через  placeList
  /// затем 15 новых значений из АПИ добаляются в  itemPlace
  Future _loadPlaces({bool isRefresh = false}) async {
    if (_currentPlaceState.value?.isLoading ?? false) {
      return;
    }

    try {
      final itemPlace = <Place>[...?_currentPlaceState.value?.data];
      _currentPlaceState.loading(_currentPlaceState.value?.data);
      final nextPlace = await model.getNextPlaceItem();
      itemPlace.addAll(nextPlace);
      _currentPlaceState.content(itemPlace);
    } on Exception catch (err) {
      _currentPlaceState.error(err);
    }
  }

  /// слушает, когда список достиг низа, и подгружает еще элементы
  void _onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent) {
      _loadPlaces(isRefresh: true);
    }
  }
}

/// Interface of [ListPlaceScreenWidgetModel].
abstract class IDebugWidgetModel extends IWidgetModel {
  /// получает список мест из АПИ
  ListenableState<EntityState<List<Place>>> get placeList;

  /// функция, которая загружает список заново при ошибке пагинации
  void reloadPlaces();

  /// функция, отвечающая за перезагрузку элементов в списке
  void onRefresh();
}
