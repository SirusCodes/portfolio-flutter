import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'landing_desktop.dart';
import 'landing_mobile.dart';

class Landing extends StatelessWidget {
  const Landing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: LandingDesktop(),
      mobile: LandingMobile(),
    );
  }
}
