import 'package:albus/localization/app_localization.dart';
import 'package:albus/routes/app_routes.dart';
import 'package:albus/themes/theme_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/utils/navigator_service.dart';
import 'core/utils/size_utils.dart';
import 'firebase_options.dart';
import 'repository/firebase_notification.dart';
import 'themes/notifier/theme_notifier.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Error handling for initialization
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    await FirebaseNotification().initNotifications();
  } catch (error) {
    // Handle Firebase initialization errors here
    print('Error initializing Firebase: $error');
  }

  try {
    await dotenv.load(fileName: "./key.env");
  } catch (error) {
    // Handle dotenv loading errors
    print('Error loading environment variables: $error');
  }

  await Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  ]);

  runApp(const ProviderScope(child: MyApp()));

  // Setting system UI style
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = ref.watch(themeNotifier).themeType;

    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme, // Get theme based on the current themeType
          navigatorKey: NavigatorService.navigatorKey,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizationDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en', '')],
          initialRoute: AppRoutes.initialRoute,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
