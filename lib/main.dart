import 'package:flutter/material.dart';
import 'package:flutter_application_4/pages/my_home_page.dart';
import 'package:flutter_application_4/theme.dart';
import 'package:flutter_control/core.dart';
import 'theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(ControlRoot(
    theme: ThemeConfig<NazevMojehoTheme>(
      builder: (context) => NazevMojehoTheme(context),
      themes: {
        Brightness.light: (control) => control.defaultTheme,
      },
      initTheme: Brightness.light,
    ),
    localization: const LocalizationConfig(
      locales: {
        'en': 'assets/localization/en.json',
        'cs': 'assets/localization/cs.json',
      },
      defaultLocale: 'en',
    ),
    states: [
      AppState.init.build(
        (_) => MyHomePage(),
      )
    ],
    app: (setup, home) => MaterialApp(
      key: setup.key,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: setup.supportedLocales,
      theme: setup.theme,
      home: home,
      locale: setup.locale,
    ),
  ));
}
