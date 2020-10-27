import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  Background({Key key}) : super(key: key);

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: CustomPaint(
        size: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        ),
        painter: BackgroundPainter(
          1,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  BackgroundPainter(this.value, {this.color});
  Color color;
  double value;

  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint()
      ..color = color
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // first rrect
    canvas.rotate(-.2);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromLTWH(-40, 330, 400, 400), Radius.circular(90)),
      _paint,
    );

    canvas.rotate(.5);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromLTWH(600, -180, 200, 200), Radius.circular(60)),
      _paint,
    );

    canvas.rotate(-.3);
    canvas.drawCircle(Offset(1600, 900), 700, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
