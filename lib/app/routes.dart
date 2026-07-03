

import 'package:crafty_bay/features/auth/presentation/screens/signin_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/signup_scren.dart';
import 'package:crafty_bay/features/auth/presentation/screens/splash_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/verify_otp.dart';
import 'package:crafty_bay/features/shered/presentation/presention/main_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../features/products/presentation/screen/product_details_screnn.dart';
import '../features/products/presentation/screen/productlist_bycategory.dart';

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


      case MainNavBar.name:
        widget = MainNavBar();
        break;




        case ProductListByCategory.name:
          Map <String,dynamic> arg = settings.arguments as Map<String,dynamic>;
          widget = ProductListByCategory(

            categoryId: arg['categoryId'],
            categoryName: arg['categoryName'],);
          break;


          case ProductDetailsScreen.name:

            final String productId = settings.arguments as String;
            widget = ProductDetailsScreen(productId: productId,);
            break;

    }

    return MaterialPageRoute(builder: (context)=>widget);
  }

}