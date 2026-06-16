

import 'package:crafty_bay/features/auth/presentation/screens/signin_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/signup_scren.dart';
import 'package:crafty_bay/features/auth/presentation/screens/splash_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/verify_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppRoutes{

  static Route <dynamic>? onGenarateRoute(RouteSettings settings) {

    Widget widget = SizedBox();

    switch(settings.name){

      case SplashScreen.name:
        widget = SplashScreen();
        break;


      case SigninScreen.name:
        widget = SigninScreen();
        break;


      case SignupScreen.name:
        widget = SignupScreen();
        break;


      case OtpVerifyScreen.name:
        widget = OtpVerifyScreen();
        break;
    }

    return MaterialPageRoute(builder: (context)=>widget);
  }

}