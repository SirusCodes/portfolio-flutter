import 'package:Portfolio/components/arrow.dart';
import 'package:Portfolio/components/avatar.dart';
import 'package:Portfolio/components/background.dart';
import 'package:Portfolio/components/side_navigation.dart';
import 'package:Portfolio/components/social_rail.dart';
import 'package:Portfolio/enums/arrow_pos.dart';
import 'package:Portfolio/screens/content.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:responsive_builder/responsive_builder.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ScreenTypeLayout(
        mobile: Container(
          child: Text("in progress"),
        ),
        desktop: Stack(
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
                  child: SideNavigation(),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Arrow(
                angle: math.pi,
                position: ArrowPos.upper,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Arrow(
                angle: 0,
                position: ArrowPos.lower,
              ),
            ),
            Avatar(),
          ],
        ),
      ),
    );
  }
}
