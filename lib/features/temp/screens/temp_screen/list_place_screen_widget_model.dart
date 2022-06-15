import 'package:dio/dio.dart';
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
  final ScrollController _scrollController = ScrollController();
  final DialogController _dialogController;
  final EntityStateNotifier<List<Place>> _currentPlaceState =
      EntityStateNotifier(null);

  @override
  ListenableState<EntityState<List<Place>>> get placeList => _currentPlaceState;

  @override
  ScrollController get scrollController => _scrollController;

  //текущая страница
  int _currentPage = 0;

  /// Create an instance [ListPlaceScreenWidgetModel].
  ListPlaceScreenWidgetModel(
    ListPlaceScreenModel model,
    this._dialogController,
  ) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    scrollController.addListener(_onScroll);
    _loadPlaces();
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
    _currentPlaceState.loading();
    final retryValue = await model.loadListPlaceAgain();
    _currentPlaceState.content(retryValue);
  }

  /// управляет пагинацей списка: первые 15 значений загружаются через  placeList
  /// затем 15 новых значений из АПИ добаляются в  itemPlace
  ///  в исключениях обрабатывается снэкбар
  Future _loadPlaces() async {
    if (_currentPlaceState.value?.isLoading ?? false) {
      return;
    }

    try {
      final itemPlace = <Place>[...?_currentPlaceState.value?.data];
      _currentPlaceState.loading(_currentPlaceState.value?.data);
      final placeList = await model.getPlace(_currentPage);
      final nextPlace = await model.getNextPlaceItem();
      _currentPage++;
      itemPlace.addAll(nextPlace);
      _currentPlaceState.content(itemPlace + placeList);
    } on Exception catch (err) {
      if (err is DioError) {
        _dialogController.showSnackBar(TagBar());
      }
      _currentPlaceState.error(err);
    }
  }

  /// слушает, когда список достиг низа, и подгружает еще элементы
  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      _loadPlaces();
    }
  }
}

/// Interface of [ListPlaceScreenWidgetModel].
abstract class IDebugWidgetModel extends IWidgetModel {
  ListenableState<EntityState<List<Place>>> get placeList;

  ScrollController get scrollController;

  void reloadPlaces();

  void onRefresh();
}
