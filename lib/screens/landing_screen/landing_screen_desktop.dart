import 'package:flutter/material.dart';

import '../../components/avatar/avatar_desktop.dart';
import '../../components/background.dart';
import '../../components/navigation/navigation_desktop.dart';
import '../../components/social_rail.dart';
import '../content.dart';

class LandingScreenDesktop extends StatelessWidget {
  const LandingScreenDesktop({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Background()),
        Align(
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: .04,
            child: SocialRail(),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: FractionallySizedBox(
            widthFactor: .90,
            child: Content(),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: FractionallySizedBox(
            heightFactor: 1,
            widthFactor: .1,
            child: NavigationDesktop(),
          ),
        ),
        AvatarDesktop(),
      ],
    );
  }
}
