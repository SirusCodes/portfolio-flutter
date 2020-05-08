import 'package:Portfolio/components/background.dart';
import 'package:Portfolio/components/side_navigation.dart';
import 'package:Portfolio/components/social_rail.dart';
import 'package:Portfolio/enums/arrow_pos.dart';
import 'package:Portfolio/provider/arrow_provider.dart';
import 'package:Portfolio/screens/content.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../extensions/hover.dart';
import 'package:provider/provider.dart';

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
            alignment: Alignment.topCenter,
            child: Arrow(
              size: _size,
              angle: math.pi,
              position: ArrowPos.upper,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Arrow(
              size: _size,
              angle: 0,
              position: ArrowPos.lower,
            ),
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

class Arrow extends StatelessWidget {
  const Arrow({
    Key key,
    @required Size size,
    this.angle,
    this.position,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final double angle;
  final ArrowPos position;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: _size / 12,
      child: Transform.rotate(
        angle: angle,
        child: Consumer<ArrowProvider>(
          builder: (context, value, child) {
            return GestureDetector(
              onTap: () => value.onTap(position),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlareActor(
                  "assets/rive/bouncing_arrow.flr",
                  animation: value.getState(position),
                ),
              ),
            ).hover(onHover: () {}, onExit: () {});
          },
        ),
      ),
    );
  }
}
