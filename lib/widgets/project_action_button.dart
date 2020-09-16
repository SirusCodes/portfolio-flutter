import 'package:url_launcher/url_launcher.dart';
import 'package:Portfolio/animations/hover_lift.dart';
import 'package:flutter/material.dart';

class ProjectActionButton extends StatefulWidget {
  const ProjectActionButton({
    Key key,
    @required this.url,
    @required this.title,
    this.constraints,
  }) : super(key: key);

  final String url;
  final String title;
  final BoxConstraints constraints;

  @override
  _ProjectActionButtonState createState() => _ProjectActionButtonState();
}

class _ProjectActionButtonState extends State<ProjectActionButton>
    with SingleTickerProviderStateMixin {
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
    return HoverLift(
      controller: _controller,
      child: MouseRegion(
        onEnter: (details) => _controller.forward(),
        onExit: (details) => _controller.reverse(),
        child: OutlineButton(
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontSize: widget.constraints.maxWidth / 55,
                ),
          ),
          splashColor: Colors.white54,
          hoverColor: Colors.white10,
          highlightedBorderColor: Colors.white,
          borderSide: BorderSide(color: Colors.white, width: 2),
          onPressed: () => _launchURL(widget.url),
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
