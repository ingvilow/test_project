import 'package:flutter/material.dart';

class TagBar extends SnackBar {
  TagBar({
    Key? key,
  }) : super(
          key: key,
          backgroundColor: Colors.red,
          content: Row(
            children: const [
              Text('Oops, some error with pagination'),
            ],
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
        );
}
