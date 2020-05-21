import 'package:flutter/material.dart';

class LandingMobile extends StatelessWidget {
  const LandingMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: _size.height / 4),
              Text(
                "Hey, I'm Darshan Rander",
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(fontSize: _size.height / 20),
              ),
              Text(
                "I develop beautiful apps.",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: _size.height / 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
