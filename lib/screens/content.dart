import 'package:flutter/material.dart';

import '../get_it/animation_get_it.dart';
import '../locator.dart';
import 'content/about/about.dart';
import 'content/landing/landing.dart';

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
    _animation.pageController = PageController()
      ..addListener(() {
        setState(() {
          _animation.pageValue = _animation.pageController.page;
        });
      });
  }

  @override
  void dispose() {
    _animation.pageController?.dispose();
    super.dispose();
  }

  static const _items = <Widget>[
    Landing(),
    About(),
    // Projects(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: PageView.builder(
        controller: _animation.pageController,
        scrollDirection: Axis.vertical,
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final curr = _animation.currentPage;
          double opacity = 0;
          if (index == curr) {
            opacity = 1 - (_animation.pageValue - curr);
          } else if (index == curr + 1 || index == curr + 2) {
            opacity = (_animation.pageValue - curr);
          }
          print("$index : $opacity");
          return Opacity(
            opacity: opacity,
            child: _items[index],
          );
        },
      ),
    );
  }
}
