import 'package:flutter/material.dart';
import './screens/landing_screen.dart';

void main() {
  runApp(MyApp());
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
          bodyText2: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LandingScreen(),
    );
  }
}
