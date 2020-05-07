import 'package:Portfolio/animations/fade_slide.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../extensions/hover.dart';

class SocialIcons extends StatefulWidget {
  SocialIcons(this.image, {Key key, this.url, this.delay}) : super(key: key);

  final String image, url;
  final double delay;

  @override
  _SocialIconsState createState() => _SocialIconsState();
}

class _SocialIconsState extends State<SocialIcons>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _liftup;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _liftup = Tween<double>(begin: 0, end: -10)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Transform.translate(
          offset: Offset(0, _liftup.value),
          child: child,
        ),
        child: GestureDetector(
          onTap: () => _launchURL(widget.url),
          child: FadeSlide(
            delay: widget.delay,
            slideBegin: -80,
            child: Image.asset("assets/social icons/${widget.image}.png"),
          ),
        ).hover(
          onHover: () => _controller.forward(),
          onExit: () => _controller.reverse(),
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
