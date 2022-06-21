import 'package:flutter/cupertino.dart';
import 'package:test_case/assets/res/guide_icons.dart';

/// класс для анимации вращения  лоадера
class AnimateLoader extends StatefulWidget {
  const AnimateLoader({Key? key}) : super(key: key);

  @override
  State<AnimateLoader> createState() => _AnimateLoaderState();
}

class _AnimateLoaderState extends State<AnimateLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController loaderSpinningController = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: loaderSpinningController,
      builder: (context, child) {
        return Transform.rotate(
          angle: loaderSpinningController.value * 25,
          child: child,
        );
      },
      child: Center(
        child: Image.asset(GuideIcons.loaderLarge),
      ),
    );
  }
}
