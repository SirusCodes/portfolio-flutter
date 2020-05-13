import 'package:flutter/material.dart';
import '../extensions/hover.dart';

class ImageCarousel extends StatefulWidget {
  ImageCarousel({Key key, this.images}) : super(key: key);
  final List<String> images;
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 10,
          child: Image.network(
            widget.images[index],
            gaplessPlayback: true,
          ),
        ),
        Flexible(
          child: Row(
            children: <Widget>[
              buildButtons(context, "<", _previous)
                  .hover(onHover: () {}, onExit: () {}),
              buildButtons(context, ">", _next)
                  .hover(onHover: () {}, onExit: () {}),
            ],
          ),
        ),
      ],
    );
  }

  FlatButton buildButtons(
      BuildContext context, String text, Function onPressed) {
    return FlatButton(
      onPressed: onPressed,
      hoverColor: Colors.white54,
      splashColor: Colors.black45,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  _next() {
    if (index < widget.images.length - 1)
      setState(() {
        index++;
      });
  }

  _previous() {
    if (index > 0)
      setState(() {
        index--;
      });
  }
}
