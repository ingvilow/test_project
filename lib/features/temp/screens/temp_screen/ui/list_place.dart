import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_case/assets/strings/const_strings.dart';
import 'package:test_case/assets/themes/text_style.dart';
import 'package:test_case/features/list_place/model/place.dart';

/// верстка элемента из списка мест
class ListPlace extends StatelessWidget {
  final Place place;
  const ListPlace({
    required this.place,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CachedNetworkImage(
        width: 350,
        height: 170,
        imageUrl: place.urls.isEmpty ? '' : place.urls.first,
        fit: BoxFit.fill,
        imageBuilder: (context, image) => Stack(
          children: [
            SizedBox(
              width: 350,
              height: 180,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: image,
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                      Colors.black45,
                      BlendMode.darken,
                    ),
                  ),
                ),
              ),
            ),
            ClipRect(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 16),
                      child: Text(
                        place.placeType,
                        style: titleSmaller,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 95,
                      padding: const EdgeInsets.all(8),
                      color: Colors.grey.shade100,
                      child: Center(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16, bottom: 5),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  place.name,
                                  style: titleBig,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                place.description,
                                overflow: TextOverflow.ellipsis,
                                style: titleSmall,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        errorWidget: (context, url, dynamic error) => const Center(
          child: Text(
            GuideString.errorStringImage,
            style: titleSmall,
          ),
        ),
      ),
    );
  }
}
