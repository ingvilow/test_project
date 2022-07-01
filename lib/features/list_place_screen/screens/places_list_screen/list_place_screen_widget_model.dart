import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_case/features/app/di/app_scope.dart';
import 'package:test_case/features/list_place/model/place.dart';
import 'package:test_case/features/list_place/service/api_service.dart';
import 'package:test_case/features/list_place_screen/screens/places_list_screen/list_place_screen.dart';
import 'package:test_case/features/list_place_screen/screens/places_list_screen/list_place_screen_model.dart';
import 'package:test_case/features/list_place_screen/screens/places_list_screen/list_place_ui_elements/snackbar_ui.dart';
import 'package:test_case/features/list_place_screen/screens/places_list_screen/list_place_ui_elements/utils/controller_dialog.dart';

/// Factory for [ListPlacesScreenWidgetModel].
ListPlacesScreenWidgetModel initScreenWidgetModelFactory(
  BuildContext context,
) {
  final model = ListPlacesScreenModel(PlaceApiService(
    context.read<IAppScope>().dio,
  ));
  return ListPlacesScreenWidgetModel(model, DialogController(context));
}

/// Widget model for [ListPlacesScreen].
class ListPlacesScreenWidgetModel
    extends WidgetModel<ListPlacesScreen, ListPlacesScreenModel>
    implements ILisPlaceScreenWidgetModel {
  @override
  final ScrollController scrollController = ScrollController();
  final EntityStateNotifier<List<Place>> _currentPlaceState =
      EntityStateNotifier();
  final DialogController _dialogController;

  @override
  EntityStateNotifier<List<Place>> get listPlaces => _currentPlaceState;

  /// Create an instance [ListPlacesScreenWidgetModel].
  ListPlacesScreenWidgetModel(
    ListPlacesScreenModel model,
    this._dialogController,
  ) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    scrollController.addListener(_onScroll);
    _placesFirstLoadError();
    // onRefresh();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  /// обновление страницы без полной перезагрузки
  @override
  Future<void> onRefresh() async {
    try {
      _isRefreshing = true;
      final retryValue = await model.loadListPlaceAgain();
      _isRefreshing = false;
      _currentPlaceState.content(retryValue);
    } on Exception {
      _dialogController.showSnackBar(const PaginationBarError());
    }
  }

  @override
  void reloadPlaces() => _loadPlaces();

  /// управляет пагинацей списка: первые 15 значений загружаются через  placeList
  /// затем 15 новых значений из АПИ добаляются в  itemPlace
  Future _loadPlaces() async {
    if (_currentPlaceState.value?.isLoading ?? false) {
      return;
    }
    try {
      final itemPlace = <Place>[...?_currentPlaceState.value?.data];
      _currentPlaceState.loading(_currentPlaceState.value?.data);
      final nextPlace = await model.getNextPlaceItem();
      _currentPlaceState.loading();
      itemPlace.addAll(nextPlace);
      _currentPlaceState.content(itemPlace);
    } on Exception {
      _dialogController.showSnackBar(const PaginationBarError());
    }
  }

  Future _placesFirstLoadError() async {
    const isFirstLoading = true;
    try {
      _currentPlaceState.loading();
      final value = await model.loadListPlaceAgain();
      _currentPlaceState.content(value);
    } on Exception catch (err) {
      if (isFirstLoading) {
        _currentPlaceState.error(err);
      }
    }
  }

  bool _isRefreshing = false;

  /// слушает, когда список достиг низа, и подгружает еще элементы
  void _onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent) {
      if (!_isRefreshing) {
        _loadPlaces();
      }
    }
  }
}

/*
* (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent)*/

/// Interface of [ListPlacesScreenWidgetModel].
abstract class ILisPlaceScreenWidgetModel extends IWidgetModel {
  /// список объектов из АПИ
  EntityStateNotifier<List<Place>> get listPlaces;

  ScrollController get scrollController;

  /// функция, которая загружает список заново при ошибке
  void reloadPlaces();

  /// обновление страницы без полной перезагрузки
  Future<void> onRefresh();
}
