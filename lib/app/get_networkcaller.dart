import 'package:crafty_bay/app/providers/auth_controller.dart';
import 'package:flutter/cupertino.dart';

import '../core/service/network_caller/network_caller.dart';
import '../features/auth/presentation/screens/signin_screen.dart';
import 'crafty_bar.dart';

NetworkCaller networkCaller() {
  return NetworkCaller(
    headers: ()=> {

        'content-type': 'application/json',
        if (AuthController.accessToken != null)
          'token': AuthController.accessToken!,
    },
    onUnauthorized: () async{

      await AuthController.clearUserData();
      Navigator.pushNamed(CraftyBar.navigatorKey.currentContext!, SigninScreen.name);


    }


  );
}
