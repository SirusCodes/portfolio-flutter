import 'package:Portfolio/components/social_icons.dart';
import 'package:Portfolio/get_it/animation_get_it.dart';
import 'package:Portfolio/locator.dart';
import 'package:Portfolio/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_animations/simple_animations.dart';

class SocialRail extends ConsumerWidget {
  SocialRail({Key key}) : super(key: key);

  final _animation = locator<AnimationGetIt>();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _size = MediaQuery.of(context).size;
    final _color = watch(themeProvider.state) ? "white" : "black";

    return Row(
      children: <Widget>[
        Flexible(
          fit: FlexFit.tight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: IconButton(
                  icon: Icon(Icons.shuffle),
                  onPressed: () {
                    _animation.rippleController
                        .forward(from: 0)
                        .then((_) => context.read(themeProvider).switchTheme());
                  },
                ),
              ),
              Spacer(),
              SocialIcons(
                "Github_$_color",
                url: "https://github.com/SirusCodes/",
                delay: 0,
              ),
              SocialIcons(
                "LinkedIn_$_color",
                url: "https://www.linkedin.com/in/darshan-rander-b28a3b193/",
                delay: .2,
              ),
              SocialIcons(
                "Twitter_$_color",
                url: "https://twitter.com/SirusTweets/",
                delay: .4,
              ),
              SocialIcons(
                "Mail_$_color",
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
