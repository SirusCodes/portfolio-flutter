import 'package:flutter/material.dart';

RichText infoText(
    TextStyle smallText, TextStyle bigText, TextStyle mediumText) {
  return RichText(
    text: TextSpan(
      text: "         ",
      style: smallText,
      children: [
        TextSpan(
          text: "Hello, ",
          style: bigText,
        ),
        TextSpan(
          text:
              "I'm Darshan, I'm currently doing my engineering from TSEC. I live in Mumbai, India. I'm a ",
        ),
        TextSpan(
          text: "Flutter ",
          style: mediumText,
        ),
        TextSpan(text: "and "),
        TextSpan(
          text: "Android ",
          style: mediumText,
        ),
        TextSpan(text: "Developer. Feel free to check my projects in "),
        TextSpan(
          text: "Projects ",
          style: mediumText,
        ),
        TextSpan(text: "section. My skills include:"),
      ],
    ),
  );
}

Column technologiesList(TextStyle mediumText, TextStyle smallText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text("Technologies", style: mediumText),
      SizedBox(height: 15),
      Text("⫸ Flutter", style: smallText),
      Text("⫸ Android", style: smallText),
      Text("", style: smallText),
      Text("", style: smallText),
      Text("", style: smallText),
    ],
  );
}

Column languageList(TextStyle mediumText, TextStyle smallText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text("Languages", style: mediumText),
      SizedBox(height: 15),
      Text("⫸ Dart", style: smallText),
      Text("⫸ Kotlin", style: smallText),
      Text("⫸ Java", style: smallText),
      Text("⫸ Python", style: smallText),
      Text("⫸ C++", style: smallText),
    ],
  );
}
