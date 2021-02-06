import 'package:portfolio/components/avatar/avatar_mobile.dart';
import 'package:portfolio/components/background.dart';
import 'package:portfolio/components/navigation/navigation_mobile.dart';
import 'package:portfolio/screens/content.dart';
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
        NavigationMobile(),
      ],
    );
  }
}
