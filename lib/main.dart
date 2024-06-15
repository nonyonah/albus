import 'package:albus/core/utils/logger.dart';
import 'package:albus/core/utils/size_utils.dart';
import 'package:albus/localization/app_localization.dart';
import 'package:albus/routes/app_routes.dart';
import 'package:albus/themes/theme_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
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
        return GetMaterialApp(
                title: 'albus',
                debugShowCheckedModeBanner: false,
                theme: theme, // Fetching theme from provider
                translations: AppLocalization(),
                locale: Get.deviceLocale,
                fallbackLocale: const Locale('en', 'US'),
                initialRoute: AppRoutes.splashScreen,
                getPages: AppRoutes.pages, // Fetching routes from AppRoutes
              );
            },
          );
      } 
  }
