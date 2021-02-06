import 'package:portfolio/get_it/animation_get_it.dart';
import 'package:portfolio/locator.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class AvatarMobile extends StatefulWidget {
  AvatarMobile({Key key}) : super(key: key);

  @override
  _AvatarMobileState createState() => _AvatarMobileState();
}

class _AvatarMobileState extends State<AvatarMobile>
    with SingleTickerProviderStateMixin {
  Animation<Offset> _offset;
  Animation<double> _radius;

  final _animation = locator<AnimationGetIt>();

  @override
  void initState() {
    super.initState();
    _animation.avatarMobileController = AnimationController(
        vsync: this, duration: Duration(seconds: 1, milliseconds: 500));
  }

  @override
  void dispose() {
    _animation.avatarMobileController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final _size = MediaQuery.of(context).size;

    _offset = Tween<Offset>(
            begin: Offset(0, 0),
            end: Offset(_size.width / 3 - 60, -_size.height / 3 + 120))
        .animate(CurvedAnimation(
            parent: _animation.avatarMobileController,
            curve: Curves.easeInCubic));

    _radius = Tween<double>(begin: 90, end: 40).animate(CurvedAnimation(
        parent: _animation.avatarMobileController, curve: Curves.easeOutCubic));
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Positioned(
      top: _size.height / 3 - 90,
      right: _size.width / 2 - 90,
      child: AnimatedBuilder(
        animation: _animation.avatarMobileController,
        builder: (context, child) {
          return Transform.translate(
            offset: _offset.value,
            child: CustomAnimation(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: Duration(seconds: 3),
              curve: Curves.easeInQuart,
              builder: (context, child, value) => Opacity(
                opacity: value,
                child: child,
              ),
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
