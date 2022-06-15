import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_case/features/list_place/model/place.dart';
import 'package:test_case/features/temp/screens/temp_screen/list_place_screen_widget_model.dart';
import 'package:test_case/features/temp/screens/temp_screen/ui/bottom_loader.dart';
import 'package:test_case/features/temp/screens/temp_screen/ui/error_screen.dart';
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
        errorBuilder: (_, error, placeList) {
          return ErrorScreen(onRefresh: wm.reloadPlaces);
        },
        loadingBuilder: (_, placesPaginated) {
          if (placesPaginated?.isEmpty ?? true) {
            return const Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: wm.onRefresh,
            child: ListView.builder(
              controller: wm.scrollController,
              itemCount: placesPaginated!.length + 1,
              itemBuilder: (context, index) {
                if (index == placesPaginated.length) {
                  return const BottomLoader();
                }
                return ListPlace(
                  place: placesPaginated[index],
                );
              },
            ),
          );
        },
        builder: (_, place) {
          return RefreshIndicator(
            onRefresh: wm.onRefresh,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListPlace(
                  place: place![index],
                );
              },
              itemCount: place!.length,
              controller: wm.scrollController,
            ),
          );
        },
      ),
    );
  }
}
