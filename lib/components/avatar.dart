import 'package:Portfolio/get_it/animation_get_it.dart';
import 'package:Portfolio/locator.dart';
import 'package:flutter/material.dart';

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
            parent: _animation.avatarController, curve: Curves.easeIn))
          ..addListener(() {
            setState(() {});
          });

    _radius = Tween<double>(begin: _longest / 10, end: _longest / 18).animate(
        CurvedAnimation(
            parent: _animation.avatarController, curve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    var _shortest = _size.shortestSide;
    var _longest = _size.longestSide;
    return Positioned(
      top: _shortest / 2 - _longest / 10,
      right: _longest / 3 - _longest / 10,
      child: Transform.translate(
        offset: _offset.value,
        child: CircleAvatar(
          radius: _radius.value,
          backgroundImage: AssetImage("assets/images/darshan.jpg"),
        ),
      ),
    );
  }
}
