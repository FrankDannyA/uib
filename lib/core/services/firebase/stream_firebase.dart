import 'package:flutter/material.dart';
import 'package:uib/core/services/firebase/auth.dart';
import 'package:uib/features/auth/view/auth_screen.dart';
import 'package:uib/features/menu_animated/view/menu_animated_screen.dart';

class StreamFirebase extends StatelessWidget {
  const StreamFirebase({Key? key}) : super(key: key);

  //rename conver to bloc
  //rename firebase stream

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (ctx, snap) {
        if (snap.hasData) {
          return const MenuAnimatedScreen();
        } else {
          return const AuthScreen();
        }
      },
    );
  }
}
