import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_case/features/list_place/model/place.dart';
import 'package:test_case/features/temp/screens/temp_screen/temp_screen_widget_model.dart';
import 'package:test_case/features/temp/screens/temp_screen/ui/list_place.dart';

/// Initialization screens (this can be a HomeScreen or SplashScreen for example).
class ListPlaceScreen extends ElementaryWidget<ListPlaceScreenWidgetModel> {
  /// Create an instance [ListPlaceScreen].
  const ListPlaceScreen({
    Key? key,
    WidgetModelFactory wmFactory = initScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ListPlaceScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(),
      body: EntityStateNotifierBuilder<List<Place>>(
        listenableEntityState: wm.placeList,
        errorBuilder: (_, __, ___) {
          return const Text('error');
        },
        loadingBuilder: (_, __) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        builder: (_, place) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListPlace(
                place: place![index],
              );
            },
            itemCount: place!.length,
            controller: wm.scrollController,
          );
        },
      ),
    );
  }
}

// value ? place!.length : place!.length + 1
