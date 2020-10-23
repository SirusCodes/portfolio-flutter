import 'package:flutter/material.dart';

import '../widgets/navigation_text.dart';

class AnimationGetIt {
  AnimationController avatarMobileController;

  PageController pageController;

  double pageValue = 0;
  int get currentPage => pageValue.floor() ?? 0;
  double get avatarAnimationValue =>
      currentPage < 1 ? pageValue - currentPage : 1;

  forward(bool isMobile) {
    avatarMobileController.forward();
  }

  reverse(bool isMobile) {
    avatarMobileController.reverse();
  }

  List<GlobalKey<NavigationTextState>> _naviagtionKeys;

  List<GlobalKey<NavigationTextState>> get getNavigationKeys => _naviagtionKeys;

  generateNavigationKeys() {
    _naviagtionKeys = List.generate(3, (_) => GlobalKey<NavigationTextState>());
    Future.delayed(Duration(seconds: 1, milliseconds: 100), () {
      _naviagtionKeys[0].currentState.lift();
    });
  }
}
