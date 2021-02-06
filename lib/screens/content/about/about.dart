import 'package:portfolio/screens/content/about/about_desktop.dart';
import 'package:portfolio/screens/content/about/about_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: AboutDesktop(),
      mobile: AboutMobile(),
    );
  }
}
