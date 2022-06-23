import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_case/features/temp/screens/temp_screen/temp_screen_widget_model.dart';

/// Initialization screens (this can be a HomeScreen or SplashScreen for example).
class ListPlacesScreen extends ElementaryWidget<ListPlacesScreenWidgetModel> {
  /// Create an instance [ListPlacesScreen].
  const ListPlacesScreen({
    Key? key,
    WidgetModelFactory wmFactory = initScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ListPlacesScreenWidgetModel wm) {
    return const Scaffold();
  }
}
