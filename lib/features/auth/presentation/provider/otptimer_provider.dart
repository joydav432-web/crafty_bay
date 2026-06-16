import 'dart:async';
import 'package:flutter/material.dart';

class OtpTimerProvider extends ChangeNotifier {
  final int _secondsForResendOtp = 30;

  Timer? _timer;
  int _secondsLeft = 30;

  int get secondsLeft => _secondsLeft;

  void startTimer() {
    _timer?.cancel();
    _secondsLeft = _secondsForResendOtp;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft <= 1) {
        _timer?.cancel();
        _secondsLeft = 0;
      } else {
        _secondsLeft--;
      }

      notifyListeners();
    });
  }

  void disposeTimer() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}