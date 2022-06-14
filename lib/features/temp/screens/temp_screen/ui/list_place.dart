import 'package:flutter/material.dart';
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
    return ListTile(
      title: Text(place.name),
      onTap: () {},
    );
  }
}
