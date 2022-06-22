import 'package:flutter/cupertino.dart';
import 'package:test_case/assets/colors/colors.dart';
import 'package:test_case/assets/strings/const_strings.dart';
import 'package:test_case/assets/themes/text_style.dart';

/// отрисовывает ошибку изображения из АПИ, вызываемую в errorWidget
class ErrorImageUI extends StatelessWidget {
  const ErrorImageUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        width: double.infinity,
        height: 180,
        color: ColorTypography.imageContainerColorError,
        child: const Center(
          child: Text(
            GuideString.errorStringImageListPlace,
            style: smallTextErrorStyle,
          ),
        ),
      ),
    );
  }
}
