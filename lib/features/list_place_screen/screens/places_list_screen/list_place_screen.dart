import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_case/features/list_place_screen/screens/places_list_screen/list_place_screen_widget_model.dart';

/// Initialization screens (this can be a HomeScreen or SplashScreen for example).
class ListPlacesScreen extends ElementaryWidget<ILisPlaceScreenWidgetModel> {
  /// Create an instance [ListPlacesScreen].
  const ListPlacesScreen({
    Key? key,
    WidgetModelFactory wmFactory = initScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ILisPlaceScreenWidgetModel wm) {
    return const Scaffold();
  }
}
