

import 'package:crafty_bay/app/providers/theme_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  static const String name = '/splash';




  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
      children: [
        
        Spacer(),

        ThemeToggle(),

        Applogo(),

        Spacer(),

        Column(
          children: [

            CircularProgressIndicator(),
            SizedBox(height: 8,),
            Text('version 1.0.1',style: TextStyle(
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


class ThemeToggle extends StatefulWidget {
  const ThemeToggle({super.key});

  @override
  State<ThemeToggle> createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<ThemeToggle> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeProvider>(
      builder: (context,themeModeProvider,_) {
        return DropdownButton<ThemeMode>(
            value: context.read<ThemeModeProvider>().themeMode,
            items: [


          DropdownMenuItem(
              value: ThemeMode.light,
              child: Text('light')),


          DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text('dark')),


              DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text('system'))
        ],

            onChanged: (newMode){

          themeModeProvider.changeThemeMode(newMode!);
            });
      }
    );
  }
}


