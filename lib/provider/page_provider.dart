import 'package:Portfolio/get_it/animation_get_it.dart';
import 'package:Portfolio/locator.dart';
import 'package:flutter/foundation.dart';

class PageProvider extends ChangeNotifier {
  final _animation = locator<AnimationGetIt>();

  bool _animState = false;

  static int _currentPage = 0;

  int get getCurrentPage => _currentPage;

  Future nextPage(int selectedPage) async {
    if (selectedPage < _animation.getDropperKeys.length) {
      _animation.getDropperKeys[_currentPage].currentState.hideToTop();
      _animation.getDropperKeys[selectedPage].currentState.showFromBottom();
    }
    // avatar will go to the side if moving to the next page
    if (selectedPage > 0) _animation.avatarController.forward();

    await Future.delayed(Duration(seconds: 2));
    notifyListeners();
  }

  Future previousPage(int selectedPage) async {
    if (selectedPage >= 0) {
      _animation.getDropperKeys[_currentPage].currentState.hideToBottom();
      _animation.getDropperKeys[selectedPage].currentState.showFromTop();
    }

    await Future.delayed(Duration(seconds: 2));
    // avatar will come in center if the page is going back to the landing screen
    if (selectedPage == 0) _animation.avatarController.reverse();
    notifyListeners();
  }

  Future navSelected(int selectedPage) async {
    _animState = true;
    if (selectedPage == _currentPage) return null;

    var keys = _animation.getNavigationKeys;
    keys[_currentPage].currentState.level();
    keys[selectedPage].currentState.lift();

    if (selectedPage > _currentPage) {
      await nextPage(selectedPage);
    } else {
      await previousPage(selectedPage);
    }

    // calls selected screen and passes value to _current;
    _currentPage = selectedPage;
    _animState = false;
  }

  // check if animations are not in progress
  void checkIfAnimProg(int selectedPage) {
    if (!_animState) {
      navSelected(selectedPage);
    }
  }
}
