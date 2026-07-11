import 'package:crafty_bay/core/service/network_caller/network_caller.dart';
import 'package:crafty_bay/features/auth/data/models/signin_params.dart';
import 'package:crafty_bay/features/auth/data/models/user_model.dart';
import 'package:flutter/foundation.dart';

import '../../../../app/get_networkcaller.dart';
import '../../../../app/urls.dart';


class SignInProvider extends ChangeNotifier {
  bool _signInProgress = false;

  bool get signInInProgress => _signInProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> signIn(SignInParams params) async {
    bool isSuccess = false;

    _signInProgress = true;
    notifyListeners();

    final NetworkResponse response = await networkCaller.postRequest(
      Urls.signInUrl,
      body: params.toJson(),
    );
    if (response.isSuccess) {
      isSuccess = true;

      _errorMessage = null;


      String token = response.body['data']['token'];
      UserModel userModel = UserModel.fromJson(response.body['data']['user']);
    } else {
      _errorMessage = response.errorMessage;
    }

    _signInProgress = false;
    notifyListeners();

    return isSuccess;
  }

  netWorkCaller() {}
}