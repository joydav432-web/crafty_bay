import 'package:flutter/material.dart';

import '../../../../app/providers/theme_mode.dart';
import 'package:provider/provider.dart';


class ThemeToggle extends StatefulWidget {
  const ThemeToggle({super.key});

  @override
  State<ThemeToggle> createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<ThemeToggle> {
  @override
  Widget build(BuildContext context) {
    return Consumer <ThemeModeProvider>(
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


