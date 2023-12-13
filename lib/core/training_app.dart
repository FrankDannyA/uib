import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uib/core/router/routes.dart';
import 'package:uib/core/ui_kit/theme/core_theme.dart';

//Bloc
//Firebase W
//Animation
//Retrofit
//Stories
//SharepPrefs
//Localization

class TrainingApp extends StatelessWidget {
  const TrainingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: '/',
      theme: coreTheme,
      routes: routes,
    );
  }
}
