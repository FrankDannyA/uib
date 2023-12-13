import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uib/core/services/translation/app_localize.dart';
import 'package:uib/core/ui_kit/widgets/widgets.dart';

import 'package:uib/features/profile/bloc/profile_cubit.dart';
import 'package:uib/generated/locale_keys.g.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  static const String routeName = '/profile_screen';

  final nameController = TextEditingController();
  final cubit = ProfileCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Align(
              alignment: const Alignment(0, -0.5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(
                      Icons.account_circle_rounded,
                      size: 160,
                    ),
                    const HBox(height: 48),
                    FutureBuilder(
                      future: cubit.initUser(),
                      builder: (context, snap) {
                        return MainTextField(
                          textEditingController: nameController,
                          title: context.read<ProfileCubit>().userName,
                        );
                      },
                    ),
                    const HBox(height: 16),
                    ElevatedButton(
                      onPressed: () => context
                          .read<ProfileCubit>()
                          .safeUser(nameController.text),
                      child: Text(LocaleKeys.change_name.tr()),
                    ),
                    const HBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (context.locale == Locale(Localization.en.name)) {
                          context.setLocale(Locale(Localization.ru.name));
                        } else if (context.locale ==
                            Locale(Localization.ru.name)) {
                          context.setLocale(Locale(Localization.en.name));
                        }
                      },
                      child: Text(LocaleKeys.change_language.tr()),
                    ),
                    const HBox(height: 16),
                    ElevatedButton(
                      onPressed: () =>
                          {context.read<ProfileCubit>().takeRelax(context)},
                      child: const Text("Relax Manager Module"),
                    ),
                    const HBox(height: 16),
                    TextButton(
                      style: TextButton.styleFrom(primary: Colors.red.shade100),
                      onPressed: () async =>
                          context.read<ProfileCubit>().logout(context),
                      child: (state is ProfileLoadedState)
                          ? const CircularProgressIndicator()
                          : Text(
                              LocaleKeys.exit.tr(),
                              style: const TextStyle(color: Colors.black54),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
