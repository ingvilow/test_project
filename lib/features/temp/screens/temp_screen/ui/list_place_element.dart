import 'package:flutter/material.dart';
import 'package:test_case/features/list_place/model/place.dart';
import 'package:test_case/features/temp/screens/temp_screen/ui/image_list_place_decoration.dart';

/// верстка элемента из списка мест
class ListPlaceElement extends StatelessWidget {
  final Place place;

  const ListPlaceElement({
    required this.place,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageDecoration(
      place: place,
    );
  }
}
