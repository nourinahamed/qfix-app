// Copyright (c) 2023, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qfixapp/counter/counter.dart';
import 'package:qfixapp/home/view/home-page.dart';
import 'package:qfixapp/l10n/l10n.dart';
import 'package:qfixapp/signup/view/signup-page.dart';
import 'package:qfixapp/home/widgets/home-page-slider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFFFFD700)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFFFFD700),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home:   HomePage(),
    );
  }
}
