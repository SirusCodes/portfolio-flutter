import 'package:Portfolio/widgets/navigation_text.dart';
import 'package:flutter/material.dart';

class SideNavigation extends StatelessWidget {
  const SideNavigation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Spacer(),
        NavigationText("About", delay: 0),
        SizedBox(height: 10),
        NavigationText("My Work", delay: .2),
        SizedBox(height: 10),
        NavigationText("Projects", delay: .4),
        Spacer(),
      ],
    );
  }
}
