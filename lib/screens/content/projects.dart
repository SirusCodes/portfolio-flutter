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
                  child: Text(
                    "Scroll Up",
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontSize: constraints.maxWidth / 60),
                  ),
                ),
              ),
              ScrollSnapList(
                scrollDirection: Axis.vertical,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return ProjectCard(
                    constraints: constraints,
                    images: [
                      "https://github.com/SirusCodes/LCO_Workout/blob/master/Example/home.png?raw=true",
                      "https://github.com/SirusCodes/LCO_Workout/blob/master/Example/exercise.png?raw=true"
                    ],
                    content:
                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                    technologies: "Flutter",
                    url: "https://github.com/SirusCodes/LCO_Workout/",
                    title: "LCO Workout",
                  );
                },
                itemSize: constraints.maxHeight,
                onItemFocus: (int i) {
                  if (i == 3)
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
