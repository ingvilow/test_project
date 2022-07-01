import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_case/assets/strings/const_strings.dart';
import 'package:test_case/assets/themes/text_style.dart';
import 'package:test_case/features/list_place/model/place.dart';
import 'package:test_case/features/list_place_screen/screens/places_list_screen/list_place_screen_widget_model.dart';
import 'package:test_case/features/list_place_screen/screens/places_list_screen/list_place_ui_elements/animate_big_loader.dart';
import 'package:test_case/features/list_place_screen/screens/places_list_screen/list_place_ui_elements/error_screen.dart';
import 'package:test_case/features/list_place_screen/screens/places_list_screen/list_place_ui_elements/list_place_element.dart';

/// Initialization screens (this can be a HomeScreen or SplashScreen for example).
class ListPlacesScreen extends ElementaryWidget<ILisPlaceScreenWidgetModel> {
  /// Create an instance [ListPlacesScreen].
  const ListPlacesScreen({
    Key? key,
    WidgetModelFactory wmFactory = initScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ILisPlaceScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          GuideString.appBarListPlaceScreenString,
          style: appBarMainScreen,
        ),
      ),
      body: EntityStateNotifierBuilder<List<Place>>(
        listenableEntityState: wm.listPlaces,
        errorBuilder: (_, error, placeList) {
          return ErrorScreen(onRefresh: wm.reloadPlaces);
        },
        loadingBuilder: (_, placesPaginated) {
          if (placesPaginated?.isEmpty ?? true) {
            return const AnimateLoader();
          }
          return RefreshIndicator(
            onRefresh: wm.onRefresh,
            child: ListView.builder(
              controller: wm.scrollController,
              itemCount: placesPaginated!.length,
              itemBuilder: (context, index) {
                return ListPlaceElement(
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
              controller: wm.scrollController,
              itemCount: place?.length ?? 0,
              itemBuilder: (context, index) {
                return ListPlaceElement(
                  place: place![index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
