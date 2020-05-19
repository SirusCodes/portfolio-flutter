import 'package:Portfolio/project_data.dart';
import 'package:Portfolio/widgets/project_card.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:simple_animations/simple_animations.dart';

class Projects extends StatefulWidget {
  const Projects({Key key}) : super(key: key);

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  bool _visibilty = true;
  int _currentScreen = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: <Widget>[
              Visibility(
                visible: _visibilty,
                child: CustomAnimation(
                  tween: Tween<double>(begin: 20, end: 60),
                  curve: Curves.easeInOut,
                  control: CustomAnimationControl.MIRROR,
                  builder: (context, child, value) {
                    return Positioned(
                      bottom: value,
                      right: 20,
                      child: child,
                    );
                  },
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
              Positioned(
                top: 20,
                right: 20,
                child: Text(
                  "$_currentScreen/${PROJECT_DATA.length}",
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontSize: constraints.maxWidth / 60),
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
                  setState(() {
                    if (i == PROJECT_DATA.length - 1)
                      _visibilty = false;
                    else
                      _visibilty = true;

                    _currentScreen = i + 1;
                  });
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
