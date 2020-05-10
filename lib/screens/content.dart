import 'package:Portfolio/get_it/animation_get_it.dart';
import 'package:Portfolio/locator.dart';
import 'package:Portfolio/screens/content/projects.dart';
import '../animations/fade_dropper.dart';
import './content/about.dart';
import './content/landing.dart';
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
    _animation.generateKeys();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        FadeDropper(key: _animation.getKeys[2], child: Projects()),
        FadeDropper(key: _animation.getKeys[1], child: About()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeDropper(key: _animation.getKeys[0], child: Landing()),
            SizedBox(
              width: _size.width / 3,
            )
          ],
        ),
      ],
    );
  }
}
