import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_case/features/list_place/models/place.dart';
import 'package:test_case/features/temp/screens/temp_screen/temp_screen_widget_model.dart';

/// Initialization screens (this can be a HomeScreen or SplashScreen for example).
class TempScreen extends ElementaryWidget<TempScreenWidgetModel> {
  /// Create an instance [TempScreen].
  const TempScreen({
    Key? key,
    WidgetModelFactory wmFactory = initScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(TempScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
      ),
      body: EntityStateNotifierBuilder<List<Place>>(
        listenableEntityState: wm.placeList,
        errorBuilder: (_, __, ___) {
          return Text('error');
        },
        loadingBuilder: (_, __) {
          return const Center(child: CircularProgressIndicator());
        },
        builder: (_, place) {
          return ListView.builder(
            itemCount: place?.length ?? 0,
            itemBuilder: (context, index) {
              return Card(
                child: Image.asset(
                  place![index].urls[index],
                  width: 100,
                  height: 100,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
