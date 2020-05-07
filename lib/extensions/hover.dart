import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

extension Hover on Widget {
  static final appContainer =
      html.window.document.getElementById('app-container');

  Widget hover({Function onHover, Function onExit}) {
    return MouseRegion(
      child: this,
      onHover: (event) {
        appContainer.style.cursor = 'pointer';
        onHover();
      },
      onExit: (event) {
        appContainer.style.cursor = 'default';
        onExit();
      },
    );
  }
}
