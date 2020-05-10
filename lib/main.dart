import 'package:Portfolio/locator.dart';
import 'package:Portfolio/provider/arrow_provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/landing_screen.dart';

void main() {
  setup();
  runApp(DevicePreview(
    enabled: false,
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        backgroundColor: Colors.black,
        accentColor: Colors.white,
        textTheme: TextTheme(
          headline2: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
          bodyText1: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400),
          bodyText2: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<ArrowProvider>(
        create: (context) => ArrowProvider(),
        child: LandingScreen(),
      ),
    );
  }
}
