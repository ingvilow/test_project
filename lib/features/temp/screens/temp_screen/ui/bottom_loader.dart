import 'package:flutter/material.dart';

/// индикатор подгрузки элементов в список внизу экрана
class BottomLoader extends StatelessWidget {
  const BottomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
