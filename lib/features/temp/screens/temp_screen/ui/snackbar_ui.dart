import 'package:flutter/material.dart';
import 'package:test_case/assets/strings/const_strings.dart';

/// это верстка снэкбара, используется для того, чтобы показать, что ошибка пагинации отработала
class PaginationBarError extends SnackBar {
  const PaginationBarError({
    Key? key,
  }) : super(
          key: key,
          backgroundColor: Colors.red,
          content: const Center(
            child: Text(GuideString.errorPaginationStringSnackBar),
          ),
        );
}
