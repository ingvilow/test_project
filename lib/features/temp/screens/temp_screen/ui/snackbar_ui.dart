import 'package:flutter/material.dart';
import 'package:test_case/assets/themes/text_style.dart';

/// это верстка снэкбара, используется для отработки ошибки пагинации
class TagBar extends SnackBar {
  final VoidCallback refresh;

  TagBar({
    required this.refresh,
    Key? key,
  }) : super(
          key: key,
          backgroundColor: Colors.red,
          content: Container(
            height: 50,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Ошибка пагинации'),
                TextButton(
                  onPressed: refresh,
                  child: const Text(
                    'Перезагрузить?',
                    style: titleSmaller,
                  ),
                ),
              ],
            ),
          ),
        );
}
