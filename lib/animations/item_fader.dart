import 'package:flutter/material.dart';

class ItemFader extends StatefulWidget {
  final Widget child;

  const ItemFader({Key key, @required this.child}) : super(key: key);

  @override
  ItemFaderState createState() => ItemFaderState();
}

class ItemFaderState extends State<ItemFader>
    with SingleTickerProviderStateMixin {
  //1 means its below, -1 means its above
  int position = 1, bottom = 1;
  AnimationController _animationController;
  Animation _animation;

  void showFromBottom() {
    setState(() {
      bottom = 1;
      position = 1;
    });
    _animationController.forward();
  }

  void hideToTop() {
    setState(() {
      bottom = 1;
      position = -1;
    });
    _animationController.reverse();
  }

  void showFromTop() {
    setState(() {
      bottom = -1;
      position = 1;
    });
    _animationController.forward();
  }

  void hideToBottom() {
    setState(() {
      bottom = -1;
      position = -1;
    });
    _animationController.reverse();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, bottom * (64 * position * (1 - _animation.value))),
          child: Opacity(
            opacity: _animation.value,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
