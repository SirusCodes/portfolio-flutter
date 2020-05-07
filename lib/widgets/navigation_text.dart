import '../animations/fade_slide.dart';
import '../animations/hover_lift.dart';
import '../extensions/hover.dart';
import 'package:flutter/material.dart';

class NavigationText extends StatefulWidget {
  NavigationText(this.text, {Key key, this.delay}) : super(key: key);
  final String text;
  final double delay;
  @override
  _NavigationTextState createState() => _NavigationTextState();
}

class _NavigationTextState extends State<NavigationText>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 80));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeSlide(
      delay: widget.delay,
      slideBegin: 120,
      child: HoverLift(
        controller: _controller,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Text(
            widget.text,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ).hover(
            onHover: () => _controller.forward(),
            onExit: () => _controller.reverse()),
      ),
    );
  }
}
