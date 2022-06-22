import 'package:flutter/material.dart';
import 'package:test_case/assets/themes/text_style.dart';
import 'package:test_case/features/list_place/model/place.dart';

class TextOverImage extends StatelessWidget {
  final Place place;

  const TextOverImage({required this.place, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              place.placeType,
              style: titleSmaller,
            ),
            const Spacer(),
            Text(
              place.name,
              style: titleBig,
              maxLines: 2,
            ),
            const SizedBox(height: 8),
            Text(
              place.description,
              overflow: TextOverflow.ellipsis,
              style: titleSmall,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
