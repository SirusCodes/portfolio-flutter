import 'package:Portfolio/provider/page_provider.dart';
import 'package:Portfolio/screens/landing_screen/landing_screen_desktop.dart';
import 'package:Portfolio/screens/landing_screen/landing_screen_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PageProvider>(
      create: (_) => PageProvider(),
      child: Material(
        child: ScreenTypeLayout(
          mobile: LandingScreenMobile(),
          tablet: LandingScreenMobile(),
          desktop: LandingScreenDesktop(),
        ),
      ),
    );
  }
}
