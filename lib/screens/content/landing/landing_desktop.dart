import 'package:flutter/material.dart';

class LandingDesktop extends StatelessWidget {
  const LandingDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Hey, I'm Darshan Rander",
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(fontSize: _size.width / 32),
              ),
              Text(
                "I develop beautiful apps.",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: _size.width / 60),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
