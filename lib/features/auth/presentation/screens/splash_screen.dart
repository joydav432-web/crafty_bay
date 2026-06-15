

import 'package:crafty_bay/features/auth/presentation/screens/signin_screen.dart';
import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  static const String name = '/splash';


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  Future<void>moveToSignIn()async{
    
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context,
        SigninScreen.name);

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    moveToSignIn();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
      children: [
        
        Spacer(),

        Applogo(),

        Spacer(),

        Column(
          children: [

            CircularProgressIndicator(),
            SizedBox(height: 8,),
            Text('${AppLocalizations.of(context)!.version} 1.0.1',style: TextStyle(
                fontSize: 15
            ),),


            SizedBox(height: 16,),



          ],
        )




      ],

      )
    );
  }


}


