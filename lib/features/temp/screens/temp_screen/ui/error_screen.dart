import 'package:flutter/material.dart';
import 'package:test_case/assets/colors/colors.dart';
import 'package:test_case/assets/res/guide_icons.dart';
import 'package:test_case/assets/strings/const_strings.dart';

/// экран ошибки, предлагает пользователю перезагрузить страницу
class ErrorScreen extends StatelessWidget {
  final VoidCallback onRefresh;

  const ErrorScreen({
    required this.onRefresh,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Image.asset(GuideIcons.errorIcon),
          ),
          const Text(
            GuideString.errorScreenString,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Colors.black45,
            ),
          ),
          const Text(
            GuideString.errorScreenSmallString,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  ColorTypography.buttonTypography,
                ),
              ),
              onPressed: onRefresh,
              child: const Text('Перезагрузить?'),
            ),
          ),
        ],
      ),
    );
  }
}
