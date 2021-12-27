import 'dart:convert';

import 'package:enterprise_flutter/modules/auth/guards/admin_guard.dart';
import 'package:enterprise_flutter/modules/auth/guards/already_authenticated_guard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:enterprise_flutter/modules/articles/models/favorite_article.dart';
import 'package:enterprise_flutter/modules/auth/guards/auth_guard.dart';
import 'package:enterprise_flutter/modules/auth/providers/auth_provider.dart';
import 'package:enterprise_flutter/modules/settings/providers/settings_provider.dart';
import 'package:enterprise_flutter/routes/router.gr.dart';

void main() async {
  Hive.registerAdapter(FavoriteArticleAdapter());

  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  await Hive.openBox('settings');
  await Hive.openBox<FavoriteArticle>('favorite_articles');
  await openAuthBox();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SettingsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

Future<void> openAuthBox() async {
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  final authKey = dotenv.env['AUTH_BOX_KEY']!;
  final containsEncryptionKey = await secureStorage.read(key: authKey);

  if (containsEncryptionKey == null) {
    final key = Hive.generateSecureKey();
    await secureStorage.write(key: authKey, value: base64UrlEncode(key));
  }

  final keyData = (await secureStorage.read(key: authKey))!;
  final encryptionKey = base64Url.decode(keyData);

  await Hive.openBox('auth', encryptionCipher: HiveAesCipher(encryptionKey));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter(
    authGuard: AuthGuard(),
    alreadyAuthenticatedGuard: AlreadyAuthenticatedGuard(),
    adminGuard: AdminGuard(),
  );

  @override
  void initState() {
    context.read<AuthProvider>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Articles',
      theme: context.watch<SettingsProvider>().theme,
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
    );
  }
}
