

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleModeProvider extends ChangeNotifier{

  Locale _currentLocale = Locale('en');

 final List <Locale>_locale = [
    Locale('en'),
    Locale('bn')
  ];

  List<Locale> get supportedLocal =>_locale;
  Locale get currentLocal =>_currentLocale;


  void changeLocale(Locale locale){
    _currentLocale = locale;
    _saveLocale(locale);
    notifyListeners();

  }


  Future <void> _saveLocale(Locale locale)async{

    SharedPreferences sharedPreferences  = await SharedPreferences.getInstance();
    await sharedPreferences.setString('Locale', locale.languageCode);

  }

  Future <void>setDefaultLocale()async{

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? locale = sharedPreferences.getString('locale');
    if(locale!=null){
      _currentLocale = Locale(locale);

      notifyListeners();
    }
  }
  }