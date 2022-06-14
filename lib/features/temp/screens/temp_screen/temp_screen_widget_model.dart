import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_case/features/app/di/app_scope.dart';
import 'package:test_case/features/list_place/model/place.dart';
import 'package:test_case/features/list_place/service/api_service.dart';
import 'package:test_case/features/temp/screens/temp_screen/temp_screen.dart';
import 'package:test_case/features/temp/screens/temp_screen/temp_screen_model.dart';

/// Factory for [ListPlaceScreenWidgetModel].
ListPlaceScreenWidgetModel initScreenWidgetModelFactory(
  BuildContext context,
) {
  final model = ListPlaceScreenModel(
    PlaceApiService(context.read<IAppScope>().dio),
  );
  return ListPlaceScreenWidgetModel(model);
}

/// Widget model for [ListPlaceScreen].
class ListPlaceScreenWidgetModel
    extends WidgetModel<ListPlaceScreen, ListPlaceScreenModel>
    implements IDebugWidgetModel {
  final ScrollController _scrollController = ScrollController();

  final EntityStateNotifier<List<Place>> _currentPlaceState =
      EntityStateNotifier(null);

  @override
  ListenableState<EntityState<List<Place>>> get placeList => _currentPlaceState;

  @override
  ScrollController get scrollController => _scrollController;
  //текущая страница
  int _currentPage = 1;

  /// Create an instance [ListPlaceScreenWidgetModel].
  ListPlaceScreenWidgetModel(ListPlaceScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    scrollController.addListener(_onScroll);
    _loadPlaces();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  /// загружает места
  Future _loadPlaces() async {
    try {
      final itemPlace = <Place>[];
      _currentPlaceState.loading();
      final placeList = await model.getPlace(_currentPage);
      itemPlace.addAll(placeList);
      _currentPlaceState.content(itemPlace);
    } on Exception catch (err) {
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
}
