

import 'package:crafty_bay/app/app_theme.dart';
import 'package:crafty_bay/app/providers/theme_mode.dart';
import 'package:crafty_bay/app/routes.dart';
import 'package:crafty_bay/features/auth/presentation/screens/splash_screen.dart';
import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';



class CraftyBar extends StatefulWidget {
  const CraftyBar({super.key});

  @override
  State<CraftyBar> createState() => _CraftyBarState();
}

class _CraftyBarState extends State<CraftyBar> {


  final ThemeModeProvider _themeModeProvider = ThemeModeProvider();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _themeModeProvider.setDefaultThemeMode();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _themeModeProvider)
      ],
      child: Consumer<ThemeModeProvider>(

        builder: (context,ThemeModeProvider,_){

        return MaterialApp(
        debugShowCheckedModeBanner:false,

        initialRoute: SplashScreen.name,
        onGenerateRoute: AppRoutes.onGenarateRoute,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeModeProvider.themeMode,

          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          supportedLocales: [
            Locale('en'),
            Locale('bn')
          ],

          locale: Locale('bn'),

      );
        }
      ),
    );
  }
}
