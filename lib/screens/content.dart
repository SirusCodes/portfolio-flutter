import 'package:Portfolio/screens/content/projects.dart';

import '../animations/item_fader.dart';
import './content/about.dart';
import './content/landing.dart';
import '../extensions/hover.dart';
import 'package:flutter/material.dart';

class Content extends StatefulWidget {
  const Content({Key key}) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  List<GlobalKey<ItemFaderState>> _key;
  int _currentView = 0;

  @override
  void initState() {
    super.initState();
    _key = List.generate(3, (_) => GlobalKey<ItemFaderState>());
    Future.delayed(Duration(milliseconds: 80), () {
      _key[0].currentState.showFromBottom();
    });
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return GestureDetector(
      onDoubleTap: () {
        previous();
      },
      onTap: () {
        next();
      },
      child: Stack(
        children: <Widget>[
          ItemFader(key: _key[2], child: Projects()),
          ItemFader(key: _key[1], child: About()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ItemFader(key: _key[0], child: Landing()),
              SizedBox(
                width: _size.width / 3,
              )
            ],
          ),
        ],
      ),
    );
  }

  void previous() {
    if (_currentView > 0) {
      _key[_currentView].currentState.hideToBottom();
      // calls previous screen and decreses counter
      _key[--_currentView].currentState.showFromTop();
    }
  }

  void next() {
    if (_currentView < _key.length - 1) {
      _key[_currentView].currentState.hideToTop();
      // calls next screen and increases counter
      _key[++_currentView].currentState.showFromBottom();
    }
  }
}
