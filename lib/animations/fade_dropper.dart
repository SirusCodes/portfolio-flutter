import 'package:flutter/material.dart';

class FadeDropper extends StatefulWidget {
  final Widget child;

  const FadeDropper({Key key, @required this.child}) : super(key: key);

  @override
  FadeDropperState createState() => FadeDropperState();
}

class FadeDropperState extends State<FadeDropper>
    with SingleTickerProviderStateMixin {
  //1 means its below, -1 means its above
  int position = 1, bottom = -1;
  AnimationController _animationController;
  Animation<double> _dropAnimation, _fadeAnimation;

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
      duration: Duration(milliseconds: 333, seconds: 3),
    );

    _dropAnimation = Tween<double>(begin: 640, end: 0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.0, 1.0, curve: Curves.easeInOutBack),
    ));

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.3, 1.0, curve: Curves.easeInOut),
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Visibility(
          //! To optimize as it will replace with a single widget rather than
          //! building whole widget.
          visible: _fadeAnimation.value != 0.0,
          child: Transform.translate(
            offset: Offset(0, position * (bottom * (_dropAnimation.value))),
            child: Opacity(
              opacity: _fadeAnimation.value,
              child: child,
            ),
          ),
        );
      },
      child: widget.child,
    );
  }
}
