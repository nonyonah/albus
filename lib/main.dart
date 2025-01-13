import 'package:albus/localization/app_localization.dart';
import 'package:albus/routes/app_routes.dart';
import 'package:albus/themes/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/utils/navigator_service.dart';
import 'core/utils/size_utils.dart';
import 'services/chain_name.dart';
import 'themes/notifier/theme_notifier.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

final chainNameResolverProvider = FutureProvider((ref) async {
  final resolver = ChainNameResolver(
    ethereumRpcUrl:
        'https://mainnet.infura.io/v3/c06046673ac14658a6a8fd0f36a2fbcf',
    baseRpcUrl: 'https://mainnet.base.org',
  );

  try {
    final ethAddress = await resolver.resolveName('vitalik.eth');
    final baseAddress = await resolver.resolveName('example.base');

    print('Resolved ETH Address: $ethAddress');
    print('Resolved Base Address: $baseAddress');

    ref.onDispose(() {
      resolver.dispose();
    });

    return resolver;
  } catch (e) {
    print('Error resolving addresses: $e');
    rethrow;
  }
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load(fileName: ".env");
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
          title: "albus",
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
