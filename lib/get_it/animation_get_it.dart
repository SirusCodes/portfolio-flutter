import 'package:Portfolio/animations/fade_dropper.dart';
import 'package:Portfolio/widgets/navigation_text.dart';
import 'package:flutter/material.dart';

class AnimationGetIt {
  AnimationController avatarDesktopController, avatarMobileController;

  forward(bool isMobile) {
    isMobile
        ? avatarMobileController.forward()
        : avatarDesktopController.forward();
  }

  reverse(bool isMobile) {
    isMobile
        ? avatarMobileController.reverse()
        : avatarDesktopController.reverse();
  }

  List<GlobalKey<FadeDropperState>> _dropperKeys;
  List<GlobalKey<NavigationTextState>> _naviagtionKeys;

  List<GlobalKey<FadeDropperState>> get getDropperKeys => _dropperKeys;
  List<GlobalKey<NavigationTextState>> get getNavigationKeys => _naviagtionKeys;

  generateDropperKeys() {
    _dropperKeys = List.generate(3, (_) => GlobalKey<FadeDropperState>());
    Future.delayed(Duration(milliseconds: 80), () {
      _dropperKeys[0].currentState.showFromTop();
    });
  }

  generateNavigationKeys() {
    _naviagtionKeys = List.generate(3, (_) => GlobalKey<NavigationTextState>());
    Future.delayed(Duration(seconds: 1, milliseconds: 100), () {
      _naviagtionKeys[0].currentState.lift();
    });
  }
}
