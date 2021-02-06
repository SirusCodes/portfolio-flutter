import 'package:portfolio/enums/arrow_pos.dart';
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

  onTap(ArrowPos pos) async {
    _setState(pos, "onTap");
    _setOther(pos, "hide");
    // wait for 2s and the unhide the i.e. when is clicks
    await Future.delayed(Duration(seconds: 2));
    _setOther(pos, "unhide");
    Future.delayed(Duration(milliseconds: 500), () {
      // let other come and then set it into idle mode
      _setOther(pos, "idle");
    });
    await Future.delayed(Duration(seconds: 1, milliseconds: 300));
    // set the clicked in idle mode after completing onTap animation
    _setState(pos, "idle");
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
