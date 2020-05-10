import 'package:Portfolio/animations/fade_dropper.dart';
import 'package:flutter/material.dart';

class AnimationGetIt {
  AnimationController avatarController;

  List<GlobalKey<FadeDropperState>> _key;

  List<GlobalKey<FadeDropperState>> get getKeys => _key;

  generateKeys() {
    _key = List.generate(3, (_) => GlobalKey<FadeDropperState>());
    Future.delayed(Duration(milliseconds: 80), () {
      _key[0].currentState.showFromTop();
    });
  }
}
