import 'package:portfolio/provider/page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationMobile extends StatefulWidget {
  NavigationMobile({Key key}) : super(key: key);

  @override
  _NavigationMobileState createState() => _NavigationMobileState();
}

class _NavigationMobileState extends State<NavigationMobile>
    with TickerProviderStateMixin {
  AnimationController _drawerController, _buttonController;
  Animation _drawUp;

  bool _drawn = false;
  @override
  void initState() {
    super.initState();
    _drawerController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _buttonController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final _height = MediaQuery.of(context).size.height;

    _drawUp = Tween<double>(begin: _height, end: 0).animate(
        CurvedAnimation(parent: _drawerController, curve: Curves.easeInCubic));
  }

  @override
  Widget build(BuildContext context) {
    final _pageProvider = Provider.of<PageProvider>(context, listen: false);

    return Stack(
      children: [
        AnimatedBuilder(
          animation: _drawUp,
          builder: (context, child) {
            return Positioned.fill(
              top: _drawUp.value,
              bottom: -_drawUp.value,
              child: child,
            );
          },
          child: Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      child: navigationButton(
                    "Home",
                    () {
                      hide();
                      _pageProvider.checkIfAnimProg(0, true);
                    },
                  )),
                  Expanded(
                      child: navigationButton(
                    "About",
                    () {
                      hide();
                      _pageProvider.checkIfAnimProg(1, true);
                    },
                  )),
                  Expanded(
                      child: navigationButton(
                    "Projects",
                    () => _pageProvider.checkIfAnimProg(2, true),
                  )),
                  Expanded(
                    child: socialIconRow(),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 10,
          child: FlatButton(
            padding: const EdgeInsets.all(10.0),
            color: Colors.white,
            onPressed: () {
              if (_drawn)
                hide();
              else
                show();
            },
            child: AnimatedIcon(
                icon: AnimatedIcons.menu_close, progress: _buttonController),
            shape: const CircleBorder(),
          ),
        ),
      ],
    );
  }

  Column socialIconRow() {
    return Column(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              socialIcon(
                "Github",
                "https://github.com/SirusCodes/",
              ),
              socialIcon(
                "LinkedIn",
                "https://www.linkedin.com/in/darshan-rander-b28a3b193/",
              ),
              socialIcon(
                "Twitter",
                "https://twitter.com/SirusTweets/",
              ),
              socialIcon(
                "Mail",
                "mailto:darshandrander@gmail.com",
              ),
            ],
          ),
        ),
        Expanded(child: Container())
      ],
    );
  }

  show() {
    _drawn = true;
    _drawerController.forward();
    _buttonController.forward();
  }

  hide() {
    _drawn = false;
    _drawerController.reverse();
    _buttonController.reverse();
  }

  Padding navigationButton(String text, Function onPressed) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: FlatButton(
        color: Color(0xFF1E1E1E),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }

  Widget socialIcon(String image, String url) {
    return Container(
      height: 50,
      width: 50,
      padding: const EdgeInsets.only(right: 1),
      child: GestureDetector(
        onTap: () => _launchURL(url),
        child: Image.asset("assets/social icons/$image.png"),
      ),
    );
  }

  _launchURL(String url) async {
    _drawerController.reverse();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
