import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _biggestText = Theme.of(context)
        .textTheme
        .bodyText1
        .copyWith(fontSize: _size.width / 40);
    final _biggerText = Theme.of(context)
        .textTheme
        .bodyText2
        .copyWith(fontSize: _size.width / 50);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: "         ",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: _size.width / 65),
                children: [
                  TextSpan(
                    text: "Hello, ",
                    style: _biggestText,
                  ),
                  TextSpan(
                    text:
                        "I'm Darshan, I'm currently doing my engineering from TSEC. I live in Mumbai, India. I'm a ",
                  ),
                  TextSpan(
                    text: "Flutter ",
                    style: _biggerText,
                  ),
                  TextSpan(text: "and "),
                  TextSpan(
                    text: "Android ",
                    style: _biggerText,
                  ),
                  TextSpan(
                      text: "Developer. Feel free to check my projects in "),
                  TextSpan(
                    text: "Projects ",
                    style: _biggerText,
                  ),
                  TextSpan(text: "section. My skills include:"),
                ],
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Languages", style: _biggerText),
                    SizedBox(height: 15),
                    Text("⫸ Dart"),
                    Text("⫸ Kotlin"),
                    Text("⫸ Java"),
                    Text("⫸ Python"),
                    Text("⫸ C++"),
                  ],
                ),
                Container(
                  color: Theme.of(context).accentColor,
                  height: 80,
                  width: 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Technologies", style: _biggerText),
                    SizedBox(height: 15),
                    Text("⫸ Flutter"),
                    Text("⫸ Android"),
                    Text(""),
                    Text(""),
                    Text(""),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
