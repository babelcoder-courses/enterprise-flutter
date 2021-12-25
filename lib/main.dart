import 'package:enterprise_flutter/modules/articles/models/favorite_article.dart';
import 'package:enterprise_flutter/modules/settings/providers/settings_provider.dart';
import 'package:enterprise_flutter/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  Hive.registerAdapter(FavoriteArticleAdapter());

  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  await Hive.openBox('settings');
  await Hive.openBox<FavoriteArticle>('favorite_articles');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SettingsProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({Key? key}) : super(key: key);

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
