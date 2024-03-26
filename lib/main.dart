
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/screens/home.dart';
import 'package:provider/provider.dart';
import 'app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'settings/setting.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => settingsProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    settingsProvider settingsprovider = Provider.of<settingsProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsprovider.language),
      title: 'Flutter Demo',
      routes: {
        home_screen.routeName: (_) => home_screen(),
      },
    );
  }
}
