import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_case/assets/strings/strings.dart';
import 'package:test_case/assets/themes/text_style.dart';
import 'package:test_case/features/list_place/model/place.dart';
import 'package:test_case/features/temp/screens/places_list_screen/list_place_screen_ui/animate_big_loader.dart';
import 'package:test_case/features/temp/screens/places_list_screen/list_place_screen_ui/error_screen.dart';
import 'package:test_case/features/temp/screens/places_list_screen/list_place_screen_ui/list_place_element.dart';
import 'package:test_case/features/temp/screens/places_list_screen/list_place_screen_widget_model.dart';

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
        toolbarHeight: 100,
        title: const Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
          child: Text(
            GuideString.appBarListPlaceScreenString,
            style: appBarMainScreen,
          ),
        ),
        elevation: 0,
      ),
      body: EntityStateNotifierBuilder<List<Place>?>(
        listenableEntityState: wm.listPlaces,
        errorBuilder: (_, error, placeList) {
          return ErrorScreen(onRefresh: wm.reloadPlaces);
        },
        loadingBuilder: (_, place) {
          return const AnimateLoader();
        },
        builder: (_, place) {
          return ListView.builder(
            itemCount: place!.length,
            itemBuilder: (context, index) {
              return ListPlaceElement(
                place: place[index],
              );
            },
          );
        },
      ),
    );
  }
}
