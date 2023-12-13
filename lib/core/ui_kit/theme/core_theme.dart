import 'package:flutter/material.dart';

final coreTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.greenAccent),
  ),
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.greenAccent.shade100),
    ),
  ),
  textTheme: Typography.blackCupertino,
  indicatorColor: Colors.greenAccent.shade400,
);
