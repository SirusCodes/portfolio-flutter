import 'package:Portfolio/components/background.dart';
import 'package:Portfolio/components/side_navigation.dart';
import 'package:Portfolio/components/social_rail.dart';
import 'package:Portfolio/screens/content.dart';
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
            alignment: Alignment.center,
            child: Content(),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ConstrainedBox(
              constraints:
                  BoxConstraints.tight(Size(_size.width / 25, _size.height)),
              child: SocialRail(),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ConstrainedBox(
              constraints:
                  BoxConstraints.loose(Size(_size.width / 10, _size.height)),
              child: SideNavigation(),
            ),
          ),
          Positioned(
            top: _size.height / 2 - _size.width / 10,
            right: _size.width / 3 - _size.width / 10,
            child: CircleAvatar(
              radius: _size.width / 10,
              backgroundImage: AssetImage("assets/images/darshan.jpg"),
            ),
          )
        ],
      ),
    );
  }
}
