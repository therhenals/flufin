import 'package:flufin/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'package:flufin/i18n/strings.g.dart';
import 'package:flufin/providers/providers.dart';
import 'package:flufin/screens/screens.dart';
import 'package:flufin/services/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // add this
  LocaleSettings.useDeviceLocale(); // and this
  runApp(
    TranslationProvider(
      child: const AppState(),
    ),
  );
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ServerService()),
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => JellyfinService()),
        ChangeNotifierProxyProvider<JellyfinService, PlayerProvider>(
          update: (_, jellyfin, __) => PlayerProvider.setJellyfin(jellyfin),
          create: (_) => PlayerProvider(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flufin',
      themeMode: ThemeMode.system,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: LocaleSettings.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      initialRoute: 'splash',
      routes: {
        'splash': (_) => const SplashScreen(),
        'tabs': (_) => const TabsScreen(),
        'player': (_) => const PlayerScreen(),
        'login': (_) => const LoginScreen(),
        'server': (_) => const ServerScreen(),
        'collection': (_) => const CollectionScreen(),
        'details': (_) => const DetailsScreen(),
        'settings': (_) => const SettingsScreen(),
        'season': (_) => const SeasonScreen(),
        'appInformation': (_) => const AppInformationScreen(),
      },
      scaffoldMessengerKey: MessengerService.messengerKey,
      darkTheme: ThemeStyles.dark(),
      theme: ThemeStyles.light(),
    );
  }
}
