import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum Anim { slide, fade }

class FadeSlide extends StatelessWidget {
  final double delay;
  final Widget child;
  final double slideBegin;

  FadeSlide({this.delay, this.child, this.slideBegin});

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<Anim>()
      ..add(Anim.fade, Tween(begin: 0.0, end: 1.0))
      ..add(Anim.slide, Tween(begin: slideBegin, end: 0.0));

    return CustomAnimation(
      curve: Curves.easeInQuad,
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: Duration(seconds: 1),
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(Anim.fade),
        child: Transform.translate(
          offset: Offset(value.get(Anim.slide), 0),
          child: child,
        ),
      ),
    );
  }
}
