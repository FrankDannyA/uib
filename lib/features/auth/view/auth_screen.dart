import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uib/core/ui_kit/widgets/widgets.dart';
import 'package:uib/features/auth/bloc/auth_cubit.dart';
import 'package:uib/features/menu_animated/view/menu_animated_screen.dart';
import 'package:uib/generated/locale_keys.g.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  static const String routeName = '/auth_screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final loginController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: (state is AuthLoadingState)
                  ? const CircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Align(
                        alignment: const Alignment(0, -0.5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            MainTextField(
                              title:
                                  '${LocaleKeys.enter_login.tr()} (example@icloud.com)',
                              textEditingController: loginController,
                            ),
                            const HBox(height: 16),
                            MainTextField(
                              isPass: true,
                              title: '${LocaleKeys.enter_pass.tr()} (123456Aa)',
                              textEditingController: passController,
                            ),
                            const HBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BlocBuilder<AuthCubit, AuthState>(
                                  builder: (context, state) {
                                    return TextButton(
                                      child: Text(LocaleKeys.enter.tr()),
                                      onPressed: () async {
                                        await context
                                            .read<AuthCubit>()
                                            .signInWithEmailAndPassword(
                                              context: context,
                                              email: loginController.text,
                                              password: passController.text,
                                            ); //в блок + try catch
                                      },
                                    );
                                  },
                                ),
                                BlocBuilder<AuthCubit, AuthState>(
                                  builder: (context, state) {
                                    return TextButton(
                                      child: Text(LocaleKeys.register.tr()),
                                      onPressed: () async {
                                        await context.read<AuthCubit>()
                                          ..createWithEmailAndPassword(
                                            context: context,
                                            email: loginController.text,
                                            password: passController.text,
                                          );
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                MenuAnimatedScreen.routeName);
                                      },
                                    );
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
