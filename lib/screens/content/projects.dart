import 'package:Portfolio/project_data.dart';
import 'package:Portfolio/widgets/project_card.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class Projects extends StatefulWidget {
  const Projects({Key key}) : super(key: key);

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  bool _visibilty = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: <Widget>[
              Visibility(
                visible: _visibilty,
                child: Positioned(
                  bottom: 20,
                  right: 20,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.arrow_upward,
                        color: Colors.white,
                      ),
                      Text(
                        "Scroll Up",
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(fontSize: constraints.maxWidth / 60),
                      ),
                    ],
                  ),
                ),
              ),
              ScrollSnapList(
                scrollDirection: Axis.vertical,
                itemCount: PROJECT_DATA.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProjectCard(
                    constraints: constraints,
                    images: PROJECT_DATA[index]["images"],
                    content: PROJECT_DATA[index]["about"],
                    technologies: PROJECT_DATA[index]["technologies"],
                    gitUrl: PROJECT_DATA[index]["git_url"],
                    apkUrl: PROJECT_DATA[index]["apk_url"],
                    title: PROJECT_DATA[index]["title"],
                  );
                },
                itemSize: constraints.maxHeight,
                onItemFocus: (int i) {
                  if (i == PROJECT_DATA.length - 1)
                    setState(() => _visibilty = false);
                  else
                    setState(() => _visibilty = true);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
