import 'package:Portfolio/get_it/animation_get_it.dart';
import 'package:Portfolio/locator.dart';
import 'package:Portfolio/screens/content/landing/landing.dart';
import 'package:Portfolio/screens/content/projects.dart';
import '../animations/fade_dropper.dart';
import './content/about.dart';
import 'package:flutter/material.dart';

class Content extends StatefulWidget {
  const Content({Key key}) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final _animation = locator<AnimationGetIt>();
  @override
  void initState() {
    super.initState();
    _animation.generateDropperKeys();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //! TODO: Change to change screen
        FadeDropper(key: _animation.getDropperKeys[2], child: Projects()),
        FadeDropper(key: _animation.getDropperKeys[1], child: About()),
        FadeDropper(key: _animation.getDropperKeys[0], child: Landing()),
      ],
    );
  }
}
