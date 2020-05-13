import 'package:Portfolio/animations/hover_lift.dart';
import 'package:Portfolio/widgets/image_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../extensions/hover.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard(
      {Key key,
      @required this.constraints,
      @required this.url,
      @required this.title,
      @required this.content,
      @required this.images,
      @required this.technologies})
      : super(key: key);
  final BoxConstraints constraints;
  final String url, title, content, technologies;
  final List<String> images;

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 80));
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: widget.constraints.maxHeight,
        minWidth: widget.constraints.maxWidth,
      ),
      child: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Column(
          children: <Widget>[
            Container(
              color: Theme.of(context).accentColor,
              width: 80,
              height: 2,
            ),
            SizedBox.fromSize(
              size: Size(widget.constraints.maxWidth - 140,
                  widget.constraints.maxHeight - 160),
              child: Row(
                children: <Widget>[
                  ImageCarousel(images: widget.images),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            widget.title,
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                .copyWith(
                                  fontSize: widget.constraints.maxWidth / 30,
                                ),
                          ),
                          Text(
                            widget.content,
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  fontSize: widget.constraints.maxWidth / 70,
                                ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Technologies used: ${widget.technologies}",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  fontSize: widget.constraints.maxWidth / 60,
                                ),
                          ),
                          Spacer(),
                          FittedBox(
                            child: HoverLift(
                              controller: _controller,
                              child: OutlineButton(
                                child: Text(
                                  "</code>",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(
                                        fontSize:
                                            widget.constraints.maxWidth / 60,
                                      ),
                                ),
                                splashColor: Colors.white54,
                                hoverColor: Colors.white10,
                                highlightedBorderColor: Colors.white,
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2),
                                onPressed: () => _launchURL(widget.url),
                              ).hover(
                                onHover: () => _controller.forward(),
                                onExit: () => _controller.reverse(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Theme.of(context).accentColor,
              width: 80,
              height: 2,
            ),
          ],
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
