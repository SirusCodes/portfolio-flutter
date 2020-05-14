import 'package:Portfolio/widgets/image_carousel.dart';
import 'package:Portfolio/widgets/project_action_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:universal_html/html.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({
    Key key,
    @required this.constraints,
    @required this.gitUrl,
    @required this.title,
    @required this.content,
    @required this.images,
    @required this.technologies,
    this.apkUrl,
  }) : super(key: key);
  final BoxConstraints constraints;
  final String gitUrl, title, content, technologies, apkUrl;
  final List<String> images;

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  List<Image> images = [];
  @override
  void initState() {
    super.initState();
    for (var image in widget.images) {
      images.add(Image.network(image));
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    for (var image in images) {
      precacheImage(image.image, context);
    }
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
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: widget.constraints.maxWidth / 4),
                    child: ImageCarousel(images: images),
                  ),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              ProjectActionButton(
                                url: widget.gitUrl,
                                title: "</code>",
                                constraints: widget.constraints,
                              ),
                              if (widget.apkUrl != null)
                                ProjectActionButton(
                                  url: widget.apkUrl,
                                  title: "Download Apk",
                                  constraints: widget.constraints,
                                ),
                            ],
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
}
