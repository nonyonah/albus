import 'package:albus/core/utils/navigator_service.dart';
import 'package:albus/core/utils/pref_utils.dart';
import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/localization/app_localization.dart';
import 'package:albus/routes/app_routes.dart';
import 'package:albus/themes/provider/theme_provider.dart';
import 'package:albus/themes/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';


var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    PrefUtils().init()
  ]).then((value) {
    runApp(const MyApp());
  });

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
          child: Consumer<ThemeProvider>(
            builder: (context, provider, child) {
              return MaterialApp(
                title: 'albus',
                debugShowCheckedModeBanner: false,
                theme: theme, // Fetching theme from provider
                navigatorKey: NavigatorService.navigatorKey,
                scaffoldMessengerKey: globalMessengerKey,
                localizationsDelegates: const [
                  AppLocalizationDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en', 'US'),
                ],
                initialRoute: AppRoutes.initialRoute,
                routes: AppRoutes.routes, // Fetching routes from AppRoutes
              );
            },
          ),
        );
      },
    );
  }
}
