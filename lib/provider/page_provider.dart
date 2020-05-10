import 'package:Portfolio/get_it/animation_get_it.dart';
import 'package:Portfolio/locator.dart';
import 'package:flutter/foundation.dart';

class PageProvider extends ChangeNotifier {
  final _animation = locator<AnimationGetIt>();

  static int _currentPage = 0;

  int get getCurrentPage => _currentPage;

  void nextPage() async {
    // avatar will go to the side if moving to the next page
    if (_currentPage == 0) _animation.avatarController.forward();

    await Future.delayed(Duration(seconds: 2));
    _currentPage++;
    notifyListeners();
  }

  void previousPage() async {
    await Future.delayed(Duration(seconds: 2));
    // avatar will come in center if the page is going back to the landing screen
    if (_currentPage == 1) _animation.avatarController.reverse();

    _currentPage--;
    notifyListeners();
  }
}
