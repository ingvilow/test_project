import 'package:flutter/cupertino.dart';
import 'package:test_case/assets/res/guide_icons.dart';

/// анимация маленького серого лоадера при подгрузке элементов списка
class AnimateSmallLoader extends StatefulWidget {
  const AnimateSmallLoader({Key? key}) : super(key: key);

  @override
  State<AnimateSmallLoader> createState() => _AnimateSmallLoaderState();
}

class _AnimateSmallLoaderState extends State<AnimateSmallLoader>
    with TickerProviderStateMixin {
  late final AnimationController smallLoaderSpinningController =
      AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    smallLoaderSpinningController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: smallLoaderSpinningController,
      builder: (context, child) {
        return Transform.rotate(
          angle: smallLoaderSpinningController.value * 25,
          child: child,
        );
      },
      child: Center(
        child: Image.asset(GuideIcons.loaderSmall),
      ),
    );
  }
}
