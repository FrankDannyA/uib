// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ru = {
  "enter_login": "Введить логин",
  "enter_pass": "Введите пароль",
  "enter": "Войти",
  "register": "Зарегистрироваться",
  "news": "Новости",
  "story": "Актуальное",
  "our_website": "Наш сайт (QR)",
  "profile": "Профиль",
  "change_name": "Сменить имя",
  "change_language": "Сменить язык",
  "exit": "Выйти",
  "scaning_is_auto": "Скаранирование происходит автоматически",
  "show_qr": "Показать Qr",
  "close": "Закрыть",
  "save": "Сохранить",
  "nead_relax": "Нужен досуг"
};
static const Map<String,dynamic> en = {
  "enter_login": "Enter login",
  "enter_pass": "Enter password",
  "enter": "login",
  "register": "register",
  "news": "News",
  "story": "Story",
  "our_website": "Our website (QR)",
  "profile": "Profile",
  "change_name": "Change name",
  "change_language": "Change languagu",
  "exit": "Exit"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru": ru, "en": en};
}
