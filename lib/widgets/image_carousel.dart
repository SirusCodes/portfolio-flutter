import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  ImageCarousel({Key key, this.images}) : super(key: key);
  final List<String> images;
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int index = 0;
  List<Image> images = [];
  @override
  void initState() {
    super.initState();
    _update();
    for (var image in widget.images) {
      images.add(Image.network(image));
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    for (var image in images) {
      precacheImage(image.image, context);
    }
  }

  bool _nextButton = true, _previousButton = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 10,
          child: images[index],
        ),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildButtons(context, "<", _previous, _previousButton),
              buildButtons(context, ">", _next, _nextButton)
            ],
          ),
        ),
      ],
    );
  }

  Widget buildButtons(BuildContext context, String text, Function onPressed, bool visible) {
    return Visibility(
      visible: visible,
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      child: FlatButton(
        onPressed: onPressed,
        hoverColor: Colors.white54,
        splashColor: Colors.black45,
        child: FittedBox(
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline2,
          ),
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
    if (index > 0) _nextButton = true;
    if (index == widget.images.length - 1) _nextButton = false;

    if (index <= widget.images.length - 1) _previousButton = true;
    if (index == 0) _previousButton = false;
  }
}
