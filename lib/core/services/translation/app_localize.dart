import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uib/generated/codegen_loader.g.dart';

class AppLocalize extends StatelessWidget {
  const AppLocalize({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final locRu = Locale(Localization.ru.name);

    return EasyLocalization(
      useOnlyLangCode: true,
      startLocale: locRu,
      fallbackLocale: locRu,
      supportedLocales: [locRu, Locale(Localization.en.name)],
      assetLoader: const CodegenLoader(),
      path: 'assets/translations',
      child: child,
    );
  }
}

enum Localization {
  ru,
  en,
}
