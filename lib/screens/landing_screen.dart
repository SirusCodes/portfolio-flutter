import 'package:Portfolio/components/social_icons.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Row(
        children: <Widget>[
          Expanded(child: SocialRail()),
          Expanded(flex: 20, child: Container()),
        ],
      ),
    );
  }
}

class SocialRail extends StatelessWidget {
  const SocialRail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Row(
      children: <Widget>[
        Flexible(
          fit: FlexFit.tight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SocialIcons(
                "Github",
                url: "https://github.com/SirusCodes/",
                delay: 0,
              ),
              SocialIcons(
                "LinkedIn",
                url: "https://www.linkedin.com/in/darshan-rander-b28a3b193/",
                delay: .2,
              ),
              SocialIcons(
                "Twitter",
                url: "https://twitter.com/SirusTweets/",
                delay: .4,
              ),
              SocialIcons(
                "Mail",
                url: "mailto:darshandrander@gmail.com",
                delay: .6,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: CustomAnimation(
            duration: Duration(seconds: 1, milliseconds: 500),
            tween: Tween(begin: 0, end: _size.height),
            builder: (context, child, value) {
              return Container(
                width: 1.5,
                color: Theme.of(context).accentColor,
                height: value,
              );
            },
          ),
        ),
      ],
    );
  }
}
