import 'package:flutter/material.dart';
import '../../../widgets/about_widgets.dart';

class AboutMobile extends StatelessWidget {
  const AboutMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    final _bigText = Theme.of(context)
        .textTheme
        .bodyText1
        .copyWith(fontSize: _size.longestSide / 30);

    final _mediumText = Theme.of(context)
        .textTheme
        .bodyText2
        .copyWith(fontSize: _size.longestSide / 38);

    final _smallText = Theme.of(context)
        .textTheme
        .bodyText2
        .copyWith(fontSize: _size.longestSide / 45);

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          infoText(_smallText, _bigText, _mediumText),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              languageList(_mediumText, _smallText),
              Container(
                color: Theme.of(context).accentColor,
                height: 80,
                width: 2,
              ),
              technologiesList(_mediumText, _smallText)
            ],
          )
        ],
      ),
    );
  }
}
