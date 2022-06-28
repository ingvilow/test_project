import 'package:flutter/cupertino.dart';
import 'package:test_case/assets/themes/text_style.dart';
import 'package:test_case/features/list_place/model/place.dart';

class TextOverImageListPlace extends StatelessWidget {
  final Place place;
  const TextOverImageListPlace({required this.place, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
    );
  }
}
