import 'package:flutter/material.dart';

/// это верстка снэкбара, используется для отработки ошибки пагинации
class TagBar extends SnackBar {
  TagBar({
    Key? key,
  }) : super(
          key: key,
          backgroundColor: Colors.red,
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text('Произошла ошибка при пагинации'),
              ],
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
        );
}
