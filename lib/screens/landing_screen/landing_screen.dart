import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../get_it/animation_get_it.dart';
import '../../locator.dart';
import '../../provider/page_provider.dart';
import 'landing_screen_desktop.dart';
import 'landing_screen_mobile.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with TickerProviderStateMixin {
  final _animation = locator<AnimationGetIt>();

  Animation<Size> sizeAnimation;
  bool fade = false, isAnimating = false, theme = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _animation.rippleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..addStatusListener(statusListener);

    final size = MediaQuery.of(context).size;

    sizeAnimation = SizeTween(begin: Size.zero, end: size).animate(
      CurvedAnimation(
        curve: Curves.easeIn,
        parent: _animation.rippleController,
      ),
    );
  }

  void statusListener(status) {
    if (status == AnimationStatus.completed)
      setState(() => fade = true);
    else if (status == AnimationStatus.forward) {
      setState(() {
        isAnimating = true;
      });
    }
  }

  @override
  void dispose() {
    _animation.rippleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PageProvider>(
      create: (_) => PageProvider(),
      child: Stack(
        children: [
          ScreenTypeLayout(
            mobile: LandingScreenMobile(),
            tablet: LandingScreenMobile(),
            desktop: LandingScreenDesktop(),
          ),
          isAnimating
              ? AnimatedBuilder(
                  animation: _animation.rippleController,
                  builder: (context, child) => Positioned(
                    width: sizeAnimation.value.width,
                    height: sizeAnimation.value.height,
                    child: child,
                  ),
                  child: AnimatedOpacity(
                    opacity: fade ? 0.0 : 1.0,
                    onEnd: () => setState(() {
                      fade = false;
                      isAnimating = false;
                      theme = !theme;
                    }),
                    curve: Curves.easeIn,
                    duration: const Duration(seconds: 1),
                    child: Container(
                      color: theme ? Colors.white : Colors.black,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
