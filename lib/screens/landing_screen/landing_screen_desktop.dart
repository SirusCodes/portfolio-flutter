import 'package:Portfolio/components/arrow.dart';
import 'package:Portfolio/components/avatar/avatar_desktop.dart';
import 'package:Portfolio/components/background.dart';
import 'package:Portfolio/components/navigation/navigation_desktop.dart';
import 'package:Portfolio/components/social_rail.dart';
import 'package:Portfolio/enums/arrow_pos.dart';
import 'package:Portfolio/provider/page_provider.dart';
import 'package:Portfolio/screens/content.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingScreenDesktop extends StatelessWidget {
  const LandingScreenDesktop({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(child: Background()),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SocialRail(),
            ),
            Expanded(flex: 20, child: Content()),
            Expanded(
              flex: 3,
              child: NavigationDesktop(),
            ),
          ],
        ),
        buildArrowConditionally(position: ArrowPos.upper),
        buildArrowConditionally(position: ArrowPos.lower),
        AvatarDesktop(), //! TODO: uncomment this
      ],
    );
  }

  Consumer<PageProvider> buildArrowConditionally({
    ArrowPos position,
  }) {
    return Consumer<PageProvider>(
      builder: (context, value, child) {
        if (ArrowPos.upper == position) {
          if (value.getCurrentPage > 0) return child;
        } else if (value.getCurrentPage < 2) return child;

        return Container();
      },
      child: Align(
        alignment: ArrowPos.upper == position
            ? Alignment.topCenter
            : Alignment.bottomCenter,
        child: Arrow(
          angle: ArrowPos.upper == position ? math.pi : 0,
          position: position,
        ),
      ),
    );
  }
}
