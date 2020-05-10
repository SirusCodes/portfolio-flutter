import 'package:Portfolio/get_it/animation_get_it.dart';
import 'package:Portfolio/locator.dart';
import 'package:Portfolio/widgets/navigation_text.dart';
import 'package:flutter/material.dart';

class SideNavigation extends StatefulWidget {
  const SideNavigation({Key key}) : super(key: key);

  @override
  _SideNavigationState createState() => _SideNavigationState();
}

class _SideNavigationState extends State<SideNavigation> {
  final _animation = locator<AnimationGetIt>();

  @override
  void initState() {
    super.initState();
    _animation.generateNavigationKeys();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Spacer(),
        NavigationText("Home", key: _animation.getNavigationKeys[0], delay: 0),
        SizedBox(height: 10),
        NavigationText("About",
            key: _animation.getNavigationKeys[1], delay: .2),
        SizedBox(height: 10),
        NavigationText("Projects",
            key: _animation.getNavigationKeys[2], delay: .4),
        Spacer(),
      ],
    );
  }
}
