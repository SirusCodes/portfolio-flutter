import 'package:Portfolio/animations/fade_slide.dart';
import 'package:Portfolio/animations/hover_lift.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcons extends StatefulWidget {
  SocialIcons(this.image, {Key key, this.url, this.delay}) : super(key: key);

  final String image, url;
  final double delay;

  @override
  _SocialIconsState createState() => _SocialIconsState();
}

class _SocialIconsState extends State<SocialIcons> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 80));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onHover: (value) => value ? _controller.forward() : _controller.reverse(),
        onTap: () => _launchURL(widget.url),
        child: FadeSlide(
          delay: widget.delay,
          slideBegin: -80,
          child: HoverLift(
              controller: _controller,
              child: Image.asset("assets/social icons/${widget.image}.png")),
        ),
      ),
    );
  }

  _launchURL(String url) async {
    _controller.reverse();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
