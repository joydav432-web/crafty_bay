import 'package:crafty_bay/app/crafty_bar.dart';
import 'package:crafty_bay/features/auth/presentation/screens/signin_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../app/providers/auth_controller.dart';

class MainNavProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  Future<void> changeIndex(int index) async {
    if (index == 2 || index == 3) {
      if (await _checkUserAuthState() == false) {
        return;
      }
    }
    _currentIndex = index;
    notifyListeners();
  }

  void backToHome() {
    changeIndex(0);
  }

  void backToCategory() {
    changeIndex(1);
  }

  Future<bool> _checkUserAuthState() async {
    if (await AuthController.isLoggedIn() == false) {
      Navigator.pushNamed(
        CraftyBar.navigatorKey.currentContext!,
        SigninScreen.name,
      );
      return false;
    } else {
      return true;
    }
  }
}
