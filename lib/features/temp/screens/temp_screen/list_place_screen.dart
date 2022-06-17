import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_case/assets/colors/colors.dart';
import 'package:test_case/assets/res/guide_icons.dart';
import 'package:test_case/assets/themes/text_style.dart';
import 'package:test_case/features/list_place/model/place.dart';
import 'package:test_case/features/temp/screens/temp_screen/list_place_screen_widget_model.dart';
import 'package:test_case/features/temp/screens/temp_screen/ui/error_screen.dart';
import 'package:test_case/features/temp/screens/temp_screen/ui/list_place.dart';
import 'package:test_case/features/temp/screens/temp_screen/ui/paginated_places_list.dart';

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
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        title: const Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
          child: Text(
            'Список\nинтересных мест',
            style: appBarMainScreen,
          ),
        ),
        elevation: 0,
      ),
      body: EntityStateNotifierBuilder<List<Place>>(
        listenableEntityState: wm.placeList,
        errorBuilder: (_, error, placeList) {
          return ErrorScreen(onRefresh: wm.reloadPlaces);
        },
        loadingBuilder: (_, placesPaginated) {
          if (placesPaginated?.isEmpty ?? true) {
            return AnimatedBuilder(
              animation: wm.loaderSpinningController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: wm.loaderSpinningController.value * 25,
                  child: child,
                );
              },
              child: Center(
                child: Image.asset(GuideIcons.loaderLarge),
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: wm.onRefresh,
            child: PlacesList(
              controller: wm.scrollController,
              place: placesPaginated,
            ),
          );
        },
        builder: (_, place) {
          return RefreshIndicator(
            strokeWidth: 4,
            color: ColorTypography.reloadButtonTypography,
            backgroundColor: ColorTypography.typographyTertiary,
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
