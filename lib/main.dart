import 'package:albus/localization/app_localization.dart';
import 'package:albus/routes/app_routes.dart';
import 'package:albus/themes/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solana/solana.dart';
import 'package:web3dart/web3dart.dart';
import 'core/utils/chain_constants.dart';
import 'core/utils/navigator_service.dart';
import 'core/utils/size_utils.dart';
import 'services/balance_checker.dart';
import 'themes/notifier/theme_notifier.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

// Asynchronous initialization for SharedPreferences
final sharedPreferencesProvider =
    FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

final balanceCheckerProvider = Provider<BalanceChecker>((ref) {
  final evmClients = {
    ChainConstants.base: Web3Client('https://base.publicnode.com', Client()),
    ChainConstants.ethereum: Web3Client(
        'https://sepolia.infura.io/v3/c06046673ac14658a6a8fd0f36a2fbcf',
        Client()),
  };

  final solanaClient = SolanaClient(
    rpcUrl: Uri.parse('https://api.mainnet-beta.solana.com'),
    websocketUrl: Uri.parse('wss://api.mainnet-beta.solana.com'),
  );

  ref.onDispose(() {
    for (final client in evmClients.values) {
      client.dispose();
    }
  });

  return BalanceChecker(evmClients, solanaClient);
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load(fileName: ".env");
  } catch (error) {
    print('Error loading .env file: $error');
  }

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWith(
          (ref) async => await SharedPreferences.getInstance(),
        ),
      ],
      child: const MyApp(),
    ),
  );

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
          theme: theme,
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
