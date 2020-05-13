import 'package:Portfolio/get_it/animation_get_it.dart';
import 'package:Portfolio/locator.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class Avatar extends StatefulWidget {
  const Avatar({
    Key key,
  }) : super(key: key);

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> with SingleTickerProviderStateMixin {
  Animation<Offset> _offset;
  Animation<double> _radius;

  final _animation = locator<AnimationGetIt>();

  @override
  void initState() {
    super.initState();
    _animation.avatarController = AnimationController(
        vsync: this, duration: Duration(seconds: 1, milliseconds: 500));
  }

  @override
  void dispose() {
    _animation.avatarController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final _size = MediaQuery.of(context).size;
    var _shortest = _size.shortestSide;
    var _longest = _size.longestSide;

    _offset = Tween<Offset>(
            begin: Offset(0, 0),
            end: Offset(
              _longest / 3 - _longest / 8,
              _shortest / 4 - _shortest / 2,
            ))
        .animate(CurvedAnimation(
            parent: _animation.avatarController, curve: Curves.easeIn));

    _radius = Tween<double>(begin: _longest / 10, end: _longest / 18).animate(
        CurvedAnimation(
            parent: _animation.avatarController, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    var _shortest = _size.shortestSide;
    var _longest = _size.longestSide;
    return Positioned(
      top: _shortest / 2 - _longest / 10,
      right: _longest / 3 - _longest / 10,
      child: AnimatedBuilder(
        animation: _animation.avatarController,
        builder: (context, child) {
          return Transform.translate(
            offset: _offset.value,
            child: CustomAnimation(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: Duration(seconds: 3),
              curve: Curves.easeInQuart,
              builder: (context, child, value) {
                return Opacity(
                  opacity: value,
                  child: child,
                );
              },
              child: CircleAvatar(
                radius: _radius.value,
                backgroundImage: AssetImage("assets/images/darshan.jpg"),
              ),
            ),
          );
        },
      ),
    );
  }
}
