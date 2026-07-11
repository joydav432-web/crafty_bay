import 'package:crafty_bay/core/service/network_caller/network_caller.dart';
import 'package:flutter/foundation.dart';

import '../../../../app/get_networkcaller.dart';
import '../../../../app/urls.dart';
import '../../data/models/otp_params.dart';


class VerifyOtpProvider extends ChangeNotifier {
  bool _verifyProgress  = false;

  bool get verifyProgress => _verifyProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> verifyOtp(VerifyOtpParams params) async {
    bool isSuccess = false;

    _verifyProgress = true;
    notifyListeners();

    final NetworkResponse response = await networkCaller.postRequest(
      Urls.verifyOtpUrl,
      body: params.toJson(),
    );
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _verifyProgress = false;
    notifyListeners();

    return isSuccess;
  }

  netWorkCaller() {}
}