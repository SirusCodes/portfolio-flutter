import '../animations/fade_slide.dart';
import '../animations/hover_lift.dart';
import '../extensions/hover.dart';
import 'package:flutter/material.dart';

class NavigationText extends StatefulWidget {
  NavigationText(this.text, {Key key, this.delay}) : super(key: key);
  final String text;
  final double delay;
  @override
  NavigationTextState createState() => NavigationTextState();
}

class NavigationTextState extends State<NavigationText>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  lift() {
    _controller.forward();
  }

  level() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return FadeSlide(
      delay: widget.delay,
      slideBegin: 120,
      child: HoverLift(
        controller: _controller,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Text(
            widget.text,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(fontSize: _size.width / 70),
          ),
        ).hover(onHover: () {}, onExit: () {}),
      ),
    );
  }
}
