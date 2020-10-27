import 'package:flutter/material.dart';

class AnimationGetIt {
  AnimationController avatarMobileController;
  AnimationController rippleController;

  PageController pageController;
  int current = 0;

  double _pageValue = 0;
  set pageValue(double value) {
    _pageValue = value;
    if (currentPage != current) animateTo(currentPage);
  }

  double get pageValue => _pageValue;

  int get currentPage => _pageValue.floor() ?? 0;
  double get avatarAnimationValue =>
      currentPage < 1 ? navigationAnimationValue : 1;
  double get navigationAnimationValue => _pageValue - currentPage;

  forward(bool isMobile) {
    avatarMobileController.forward();
  }

  reverse(bool isMobile) {
    avatarMobileController.reverse();
  }

  void animateTo(selected) {
    pageController.animateToPage(
      selected,
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 500),
    );
  }
}
