import 'package:Portfolio/components/avatar/avatar_mobile.dart';
import 'package:Portfolio/components/background.dart';
import 'package:Portfolio/screens/content.dart';
import 'package:flutter/material.dart';

class LandingScreenMobile extends StatelessWidget {
  const LandingScreenMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(),
        Content(),
        AvatarMobile(),
      ],
    );
  }
}
