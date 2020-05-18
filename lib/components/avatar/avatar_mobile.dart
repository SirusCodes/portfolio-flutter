import 'package:flutter/material.dart';

class AvatarMobile extends StatefulWidget {
  AvatarMobile({Key key}) : super(key: key);

  @override
  _AvatarMobileState createState() => _AvatarMobileState();
}

class _AvatarMobileState extends State<AvatarMobile>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Positioned(
      top: _size.height / 3 - 90,
      right: _size.width / 2 - 90,
      child: CircleAvatar(
        radius: 90,
        backgroundImage: AssetImage("assets/images/darshan.jpg"),
      ),
    );
  }
}
