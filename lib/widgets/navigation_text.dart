import 'package:Portfolio/provider/page_provider.dart';
import 'package:provider/provider.dart';
import '../animations/fade_slide.dart';
import 'package:flutter/material.dart';

class NavigationText extends StatefulWidget {
  NavigationText(
    this.text, {
    Key key,
    this.delay,
    this.index,
  }) : super(key: key);

  final String text;
  final double delay;
  final int index;

  @override
  NavigationTextState createState() => NavigationTextState();
}

class NavigationTextState extends State<NavigationText> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _animation = Tween<double>(begin: 1, end: 1.2)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
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
    final _pageProvider = Provider.of<PageProvider>(context, listen: false);
    return FadeSlide(
      delay: widget.delay,
      slideBegin: 120,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) => Transform.scale(
          scale: _animation.value,
          child: child,
        ),
        child: InkWell(
          onTap: () => _pageProvider.checkIfAnimProg(widget.index),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              widget.text,
              style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: _size.width / 70),
            ),
          ),
        ),
      ),
    );
  }
}
