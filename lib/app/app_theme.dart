

import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme{


  static ThemeData get lightTheme => _lightThemeData;
  static ThemeData get darkTheme =>_darkThemeData;

  static final ThemeData _lightThemeData = ThemeData(

    colorSchemeSeed: AppColors.themeColor,

    progressIndicatorTheme: ProgressIndicatorThemeData(

      color: AppColors.themeColor
    ),

    scaffoldBackgroundColor: AppColors.scaffoldBackground,

    textTheme: TextTheme(
        headlineMedium: TextStyle(
        fontWeight: FontWeight.w600,

      ),

      headlineSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.themeColor
      ),

      labelLarge: TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.largeColor
      )

    ),

    appBarTheme: AppBarTheme(

      backgroundColor: Colors.white,
    ),

    inputDecorationTheme: _inputDecorationTheme,

      filledButtonTheme: _filledButtonThemeData

  );



  static final ThemeData _darkThemeData = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    brightness: Brightness.dark,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.themeColor
    ),

    inputDecorationTheme: _inputDecorationTheme,
      filledButtonTheme: _filledButtonThemeData
  );

  static final InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(

      contentPadding: EdgeInsets.only(left: 12),

      border: OutlineInputBorder(
        borderSide: BorderSide(
            color: AppColors.themeColor,
            width: 3

        )
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.themeColor,
              width: 3
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.themeColor,
              width: 3
          )
      ),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.enableBorderColor,
              width: 3

          )
      )
  );

 static final FilledButtonThemeData _filledButtonThemeData = FilledButtonThemeData(

   style:FilledButton.styleFrom(
       backgroundColor: AppColors.themeColor,
       fixedSize: Size.fromWidth(double.maxFinite),
       shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(8)
       )
   )
 );

}