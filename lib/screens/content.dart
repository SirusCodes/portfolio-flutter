import 'package:Portfolio/provider/page_provider.dart';
import 'package:Portfolio/screens/content/projects.dart';
import 'package:provider/provider.dart';
import './content/about.dart';
import './content/landing.dart';
import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  const Content({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    List<Widget> _widgets = [
      Row(
        children: <Widget>[
          SizedBox(
            width: _size.width / 16,
          ),
          Landing(),
        ],
      ),
      About(),
      Projects()
    ];

    return Consumer<PageProvider>(
      builder: (context, value, child) {
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: _widgets[value.getCurrentPage],
        );
      },
    );
  }
}
