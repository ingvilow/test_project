import 'package:flutter/material.dart';
import 'package:test_case/assets/strings/const_strings.dart';

/// это верстка снэкбара, используется для того, чтобы показать, что ошибка обновения отработала
class PaginationBarError extends SnackBar {
  const PaginationBarError({
    Key? key,
  }) : super(
          key: key,
          backgroundColor: Colors.red,
          content: const SizedBox(
            width: double.infinity,
            height: 20,
            child: Center(
              child: Text(GuideString.errorPaginationStringSnackBar),
            ),
          ),
        );
}
