import 'package:Portfolio/animations/item_fader.dart';
import 'package:flutter/material.dart';

class AnimationGetIt {
  AnimationController avatarController;

  List<GlobalKey<ItemFaderState>> _key;

  List<GlobalKey<ItemFaderState>> get getKeys => _key;

  generateKeys() {
    _key = List.generate(3, (_) => GlobalKey<ItemFaderState>());
    Future.delayed(Duration(milliseconds: 80), () {
      _key[0].currentState.showFromBottom();
    });
  }
}
