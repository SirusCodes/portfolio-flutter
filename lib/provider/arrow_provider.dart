import 'package:Portfolio/enums/arrow_pos.dart';
import 'package:flutter/foundation.dart';

class ArrowProvider extends ChangeNotifier {
  String _uAnimation = "idle";
  String _lAnimation = "idle";

  String getState(ArrowPos pos) {
    if (pos == ArrowPos.lower) {
      return _lAnimation;
    } else {
      return _uAnimation;
    }
  }

  onTap(ArrowPos pos) {
    _setState(pos, "onTap");
    _setOther(pos, "hide");
    Future.delayed(Duration(seconds: 3, milliseconds: 300), () {
      _setOther(pos, "unhide");
      _setState(pos, "idle");
      Future.delayed(Duration(milliseconds: 300), () {
        _setOther(pos, "idle");
      });
    });
  }

  _setState(ArrowPos pos, String cmd) {
    if (pos == ArrowPos.lower) {
      _setLower(cmd);
    } else {
      _setUpper(cmd);
    }
    notifyListeners();
  }

  void _setLower(String cmd) {
    _lAnimation = cmd;
  }

  void _setUpper(String cmd) {
    _uAnimation = cmd;
  }

  void _setOther(ArrowPos pos, String cmd) {
    if (pos == ArrowPos.lower) {
      _setState(ArrowPos.upper, cmd);
    } else {
      _setState(ArrowPos.lower, cmd);
    }
  }
}
