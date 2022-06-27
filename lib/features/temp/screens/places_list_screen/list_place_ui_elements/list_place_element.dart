import 'package:flutter/material.dart';
import 'package:test_case/assets/colors/colors.dart';
import 'package:test_case/features/list_place/model/place.dart';
import 'package:test_case/features/temp/screens/places_list_screen/list_place_ui_elements/image_list_place_decoration.dart';
import 'package:test_case/features/temp/screens/places_list_screen/list_place_ui_elements/text_over_image.dart';

/// верстка элемента из списка мест
class ListPlaceElement extends StatelessWidget {
  final Place place;

  const ListPlaceElement({
    required this.place,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ColoredBox(
          color: ColorTypography.typographyFourth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImageDecoration(place: place),
              TextOverImageListPlace(place: place),
            ],
          ),
        ),
      ),
    );
  }
}
