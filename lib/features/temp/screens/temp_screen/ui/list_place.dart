import 'package:flutter/material.dart';
import 'package:test_case/assets/colors/colors.dart';
import 'package:test_case/features/list_place/model/place.dart';
import 'package:test_case/features/temp/screens/temp_screen/ui/image_list_place_decoration.dart';
import 'package:test_case/features/temp/screens/temp_screen/ui/text_over_image_list_place.dart';

/// верстка элемента из списка мест
class ListPlace extends StatelessWidget {
  final Place place;

  const ListPlace({
    required this.place,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                const ColoredBox(
                  color: ColorTypography.typographyFourth,
                  child: SizedBox(
                    height: 180,
                    width: double.infinity,
                  ),
                ),
                ImageDecoration(
                  place: place,
                ),
                TextOverImage(place: place),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
