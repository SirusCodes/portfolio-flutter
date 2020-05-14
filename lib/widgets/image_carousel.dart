import 'package:flutter/material.dart';
import '../extensions/hover.dart';

class ImageCarousel extends StatefulWidget {
  ImageCarousel({Key key, this.images}) : super(key: key);
  final List<Image> images;
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int index = 0;

  bool _nextButton = true, _previousButton = false;
  @override
  void initState() {
    super.initState();
    _update();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 10,
          child: widget.images[index],
        ),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildButtons(context, "<", _previous, _previousButton)
                  .hover(onHover: () {}, onExit: () {}),
              buildButtons(context, ">", _next, _nextButton)
                  .hover(onHover: () {}, onExit: () {}),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildButtons(
      BuildContext context, String text, Function onPressed, bool visible) {
    return Visibility(
      visible: visible,
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      child: FlatButton(
        onPressed: onPressed,
        hoverColor: Colors.white54,
        splashColor: Colors.black45,
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }

  _next() {
    if (index < widget.images.length - 1)
      setState(() {
        index++;
        _update();
      });
  }

  _previous() {
    if (index > 0)
      setState(() {
        index--;
        _update();
      });
  }

  _update() {
    if (index == widget.images.length - 1)
      _nextButton = false;
    else if (index > 0 && index < widget.images.length - 1) {
      _nextButton = true;
      _previousButton = true;
    } else if (index == 0) _previousButton = false;
  }
}
