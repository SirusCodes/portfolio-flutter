import 'package:portfolio/widgets/image_carousel.dart';
import 'package:portfolio/widgets/project_action_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProjectCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: constraints.maxHeight,
        minWidth: constraints.maxWidth,
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
              size:
                  Size(constraints.maxWidth - 140, constraints.maxHeight - 160),
              child: Row(
                children: <Widget>[
                  if (images != null)
                    ConstrainedBox(
                      constraints:
                          BoxConstraints(maxWidth: constraints.maxWidth / 4),
                      child: ImageCarousel(images: images),
                    ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            title,
                            style:
                                Theme.of(context).textTheme.headline2.copyWith(
                                      fontSize: constraints.maxWidth / 20,
                                    ),
                          ),
                          Text(
                            content,
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  fontSize: constraints.maxWidth / 55,
                                ),
                          ),
                          Spacer(),
                          Text(
                            "Technologies used: $technologies",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  fontSize: constraints.maxWidth / 45,
                                ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              ProjectActionButton(
                                url: gitUrl,
                                title: "</code>",
                                constraints: constraints,
                              ),
                              if (apkUrl != null)
                                ProjectActionButton(
                                  url: apkUrl,
                                  title: "Download Apk",
                                  constraints: constraints,
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
