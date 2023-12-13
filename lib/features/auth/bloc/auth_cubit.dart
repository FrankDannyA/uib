import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uib/core/services/firebase/auth.dart';
import 'package:uib/features/menu_animated/view/menu_animated_screen.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  Future<void> signInWithEmailAndPassword({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoadingState());
      await Auth().signInWithEmailAndPassword(
        email: email,
        pass: password,
      );
      emit(AuthLoadedState());
      Navigator.of(context).pushReplacementNamed(MenuAnimatedScreen.routeName);
    } catch (e) {}
  }

  Future<void> createWithEmailAndPassword({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoadingState());
      await Auth().createWithEmailAndPassword(
        email: email,
        pass: password,
      );
      emit(AuthLoadedState());
      Navigator.of(context).pushReplacementNamed(MenuAnimatedScreen.routeName);
    } catch (e) {}
  }
}
