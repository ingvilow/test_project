import 'package:flutter/material.dart';
import 'package:test_case/features/list_place/model/place.dart';
import 'package:test_case/features/temp/screens/temp_screen/ui/list_place.dart';

class PlacesList extends StatelessWidget {
  final List<Place>? place;
  final ScrollController controller;
  const PlacesList({required this.place, required this.controller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: place!.length + 1,
      itemBuilder: (context, index) {
        if (index == place!.length) {
          return const CircularProgressIndicator();
        }
        return ListPlace(
          place: place![index],
        );
      },
    );
  }
}
