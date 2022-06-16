import 'package:flutter/material.dart';
import 'package:test_case/assets/colors/colors.dart';
import 'package:test_case/assets/themes/text_style.dart';
import 'package:test_case/features/list_place/model/place.dart';

/// список мест
class ListPlace extends StatelessWidget {
  final Place place;

  const ListPlace({
    required this.place,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRect(
            child: SizedBox(
              width: 350,
              height: 170,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 85,
                      padding: const EdgeInsets.all(8),
                      color: Colors.grey.shade100,
                      child: Center(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                place.name,
                                style: titleBig,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                place.description,
                                overflow: TextOverflow.ellipsis,
                                style: titleSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Ink.image(
                    colorFilter: const ColorFilter.mode(
                      Colors.black45,
                      BlendMode.darken,
                    ),
                    image: NetworkImage(
                      place.urls.first,
                    ),
                    fit: BoxFit.cover,
                    child: Align(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              place.placeType,
                              style: titleSmaller,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_outline,
                              color: ColorTypography.typographyTertiary,
                            ),
                          ),
                        ],
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
