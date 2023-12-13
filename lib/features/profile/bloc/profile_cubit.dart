import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uib/core/services/api_service/api_service.dart';
import 'package:uib/core/services/firebase/auth.dart';
import 'package:uib/core/services/translation/app_localize.dart';
import 'package:uib/features/auth/view/auth_screen.dart';
import 'package:dio/dio.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());

  String userName = '';

  Future<void> initUser() async {
    emit(ProfileLoadingState());
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? name = prefs.getString('name');
    userName = name ?? '';
  }

  Future<void> safeUser(String name) async {
    emit(ProfileLoadingState());
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    emit(ProfileLoadedState());
  }

  Future<void> logout(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(ProfileLoadingState());
    await Auth().signOut();
    await prefs.setString('name', '');
    Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
    emit(ProfileLoadedState());
  }

  void takeRelax(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        final apiService =
            ApiService(Dio(BaseOptions(contentType: 'application/json')));

        return FutureBuilder(
          future: apiService.getTasks(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.done) {
              final data = snap.data!;

              return AlertDialog(
                title: Text(
                  "${data.activity}",
                  textAlign: TextAlign.center,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('type: ${data.type}'),
                    Text('participants: ${data.participants}'),
                    Text('price: ${data.price}\$'),
                    Text('accessibility: ${data.accessibility}')
                  ],
                ),
              );
            }
            return const AlertDialog(
              content: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
