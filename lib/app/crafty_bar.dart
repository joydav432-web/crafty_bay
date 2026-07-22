
import 'package:crafty_bay/app/app_theme.dart';
import 'package:crafty_bay/app/providers/lacale_provider.dart';
import 'package:crafty_bay/app/providers/thememode_provider.dart';
import 'package:crafty_bay/app/routes.dart';
import 'package:crafty_bay/features/auth/presentation/screens/splash_screen.dart';
import 'package:crafty_bay/features/shered/presentation/provider/main_nav_provider.dart';
import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';



class CraftyBar extends StatefulWidget {
  const CraftyBar({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<CraftyBar> createState() => _CraftyBarState();
}

class _CraftyBarState extends State<CraftyBar> {


  final ThemeModeProvider _themeModeProvider = ThemeModeProvider();
  final LocaleModeProvider _localeModeProvider = LocaleModeProvider();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _themeModeProvider.setDefaultThemeMode();
    _localeModeProvider.setDefaultLocale();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _themeModeProvider),
        ChangeNotifierProvider.value(value: _localeModeProvider),
        ChangeNotifierProvider(create: (_)=>MainNavProvider()),
      ],
      child: Consumer<LocaleModeProvider>(builder:
          (context,localModeProvider,_){
          return Consumer<ThemeModeProvider>(

            builder: (context,themeModeProvider,_){

            return MaterialApp(
              navigatorKey: CraftyBar.navigatorKey,
            debugShowCheckedModeBanner:false,

            initialRoute: SplashScreen.name,
            onGenerateRoute: AppRoutes.onGenarateRoute,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeModeProvider.themeMode,

              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],

              supportedLocales:localModeProvider.supportedLocal,

              locale: localModeProvider.currentLocal,

          );
            }
          );
        }
      ),
    );
  }
}
