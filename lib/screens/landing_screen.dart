import 'package:Portfolio/components/background.dart';
import 'package:Portfolio/components/side_navigation.dart';
import 'package:Portfolio/components/social_rail.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Material(
      child: Stack(
        children: <Widget>[
          Positioned.fill(child: Background()),
          Align(
            alignment: Alignment.centerLeft,
            child: ConstrainedBox(
              constraints:
                  BoxConstraints.tight(Size(_size.width / 23, _size.height)),
              child: SocialRail(),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ConstrainedBox(
              constraints:
                  BoxConstraints.tight(Size(_size.width / 8, _size.height)),
              child: SideNavigation(),
            ),
          ),
        ],
      ),
    );
  }
}
