

import 'package:email_validator/email_validator.dart';

class Validators{

  static String? validateInput(String? input, String message) {
    if (input == null || input.trim().isEmpty) {
      return message;
    }
    return null;
  }

  static String? validateEmail(String?input){
    if (EmailValidator.validate(input?? '')==false){

      return "enter valid email";
    }
    return null;

  }


  static String? validatePassword(String?input){


    if((input?? '').length<6){

      return "more then 6";
    }

    return null;
  }


  static String? validateConfirmPassword(String? input,String password){

    if(input==password){
      return "password not matches";
    }
    return null;
  }



  }