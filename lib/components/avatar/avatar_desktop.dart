import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../get_it/animation_get_it.dart';
import '../../locator.dart';

class AvatarDesktop extends StatelessWidget {
  const AvatarDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _animation = locator<AnimationGetIt>();
    final _size = MediaQuery.of(context).size;
    var _shortest = _size.shortestSide;
    var _longest = _size.longestSide;
    return Positioned(
      top: _shortest / 2 - _longest / 10,
      right: _longest / 3 - _longest / 10,
      child: IgnorePointer(
        child: AnimatedBuilder(
          animation: _animation.pageController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset.lerp(
                Offset(0, 0),
                Offset(
                  _longest / 3 - _longest / 8,
                  _shortest / 4 - _shortest / 2,
                ),
                _animation.avatarAnimationValue,
              ),
              child: CustomAnimation(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: Duration(seconds: 3),
                curve: Curves.easeInQuart,
                builder: (context, child, value) {
                  return Opacity(
                    opacity: value,
                    child: child,
                  );
                },
                child: CircleAvatar(
                  radius: lerpDouble(
                    _longest / 10,
                    _longest / 20,
                    _animation.avatarAnimationValue,
                  ),
                  backgroundImage: AssetImage("assets/images/darshan.jpg"),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
