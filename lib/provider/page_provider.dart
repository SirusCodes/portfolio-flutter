import 'package:Portfolio/get_it/animation_get_it.dart';
import 'package:Portfolio/locator.dart';
import 'package:flutter/foundation.dart';

class PageProvider extends ChangeNotifier {
  final _animation = locator<AnimationGetIt>();

  static int _currentPage = 0;

  int get getCurrentPage => _currentPage;

  void nextPage() async {
    _next();
    // avatar will go to the side if moving to the next page
    // -1 because in next currentPage is incremented by 1
    if (_currentPage - 1 == 0) _animation.avatarController.forward();

    await Future.delayed(Duration(seconds: 2));
    notifyListeners();
  }

  void previousPage() async {
    _previous();

    await Future.delayed(Duration(seconds: 2));
    // avatar will come in center if the page is going back to the landing screen
    // +1 because in next currentPage is decremented by 1
    if (_currentPage + 1 == 1) _animation.avatarController.reverse();
    notifyListeners();
  }

  void _previous() {
    if (_currentPage > 0) {
      _animation.getKeys[_currentPage].currentState.hideToBottom();
      // calls previous screen and decreses counter
      _animation.getKeys[--_currentPage].currentState.showFromTop();
    }
  }

  void _next() {
    if (_currentPage < _animation.getKeys.length - 1) {
      _animation.getKeys[_currentPage].currentState.hideToTop();
      // calls next screen and increases counter
      _animation.getKeys[++_currentPage].currentState.showFromBottom();
    }
  }
}
