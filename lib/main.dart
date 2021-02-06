import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

import 'locator.dart';
import 'screens/landing_screen/landing_screen.dart';
import 'utils/themes.dart';

void main() {
  setup();
  runApp(
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final theme = watch(themeProvider.state);
    return MaterialApp(
      title: 'portfolio',
      debugShowCheckedModeBanner: false,
      theme: theme ? darkTheme : lightTheme,
      home: Material(child: LandingScreen()),
    );
  }
}
