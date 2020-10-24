import 'dart:ui';

import 'package:flutter/material.dart';

import '../animations/fade_slide.dart';
import '../get_it/animation_get_it.dart';
import '../locator.dart';

class NavigationText extends StatelessWidget {
  NavigationText(
    this.text, {
    Key key,
    this.delay,
    this.index,
    this.scale,
    this.onTap,
  }) : super(key: key);

  final String text;
  final double delay, scale;
  final int index;
  final VoidCallback onTap;

  final _animation = locator<AnimationGetIt>();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return FadeSlide(
      delay: delay,
      slideBegin: 120,
      child: AnimatedBuilder(
        animation: _animation.pageController,
        builder: (context, child) => Transform.scale(
          scale: scale,
          child: child,
        ),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(fontSize: _size.width / 70),
            ),
          ),
        ),
      ),
    );
  }
}
