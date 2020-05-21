import 'package:flutter/material.dart';

class NavigationMobile extends StatefulWidget {
  NavigationMobile({Key key}) : super(key: key);

  @override
  _NavigationMobileState createState() => _NavigationMobileState();
}

class _NavigationMobileState extends State<NavigationMobile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 20,
          right: 10,
          child: FlatButton(
            padding: const EdgeInsets.all(10.0),
            color: Colors.white,
            onPressed: () {},
            child: Icon(
              Icons.menu,
            ),
            shape: CircleBorder(),
          ),
        ),
      ],
    );
  }
}
