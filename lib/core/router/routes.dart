import 'package:uib/core/services/firebase/stream_firebase.dart';
import 'package:uib/features/auth/view/auth_screen.dart';
import 'package:uib/features/menu_animated/view/menu_animated_screen.dart';
import 'package:uib/features/news/view/news_screen.dart';
import 'package:uib/features/profile/view/profile_screen.dart';
import 'package:uib/features/qr/view/qr_screen.dart';
import 'package:uib/features/story/view/story_screen.dart';

final routes = {
  '/': (ctx) => const StreamFirebase(),
  MenuAnimatedScreen.routeName: (ctx) => const MenuAnimatedScreen(),
  AuthScreen.routeName: (ctx) => const AuthScreen(),
  NewsScreen.routeName: (ctx) => NewsScreen(),
  StoryScreen.routeName: (ctx) => StoryScreen(),
  QrScreen.routeName: (ctx) => const QrScreen(),
  ProfileScreen.routeName: (ctx) => ProfileScreen(),
};
