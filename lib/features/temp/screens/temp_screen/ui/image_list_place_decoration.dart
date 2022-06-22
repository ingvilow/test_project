import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_case/assets/colors/colors.dart';
import 'package:test_case/features/list_place/model/place.dart';
import 'package:test_case/features/temp/screens/temp_screen/ui/error_image_widget.dart';

/// верстка для отображения изображения из АПИ в элементе списка в list_place.dart
class ImageDecoration extends StatelessWidget {
  final Place place;

  const ImageDecoration({required this.place, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: 100,
      imageUrl: place.urls.isEmpty ? '' : place.urls.first,
      fit: BoxFit.fill,
      imageBuilder: (context, image) => Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: SizedBox(
          width: double.infinity,
          height: 180,
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                  ColorTypography.blendImageColor,
                  BlendMode.darken,
                ),
              ),
            ),
          ),
        ),
      ),
      // ignore: avoid_types_on_closure_parameters
      errorWidget: (context, url, Object? error) => const ErrorImageUI(),
    );
  }
}
