import 'package:portfolio/get_it/animation_get_it.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/widgets/navigation_text.dart';
import 'package:flutter/material.dart';

class NavigationDesktop extends StatefulWidget {
  const NavigationDesktop({Key key}) : super(key: key);

  @override
  _NavigationDesktopState createState() => _NavigationDesktopState();
}

class _NavigationDesktopState extends State<NavigationDesktop> {
  final _animation = locator<AnimationGetIt>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Spacer(),
        NavigationText(
          "Home",
          onTap: () => _animation.animateTo(0),
          delay: 0,
          index: 0,
          scale: 1,
        ),
        SizedBox(height: 10),
        NavigationText(
          "About",
          delay: .2,
          index: 1,
          onTap: () => _animation.animateTo(1),
          scale: 1,
        ),
        SizedBox(height: 10),
        NavigationText(
          "Projects",
          delay: .4,
          index: 2,
          onTap: () => _animation.animateTo(2),
          scale: 1,
        ),
        Spacer(),
      ],
    );
  }
}
