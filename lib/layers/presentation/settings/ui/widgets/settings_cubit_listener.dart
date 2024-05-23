import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/core/extensions/context/navigation.dart';
import 'package:shopink/core/extensions/context/showing.dart';
import 'package:shopink/core/routing/routes.dart';
import 'package:shopink/layers/presentation/settings/cubit/settings_cubit/settings_cubit.dart';

class SettingsCubitListener extends StatelessWidget {
  final Widget child;
  const SettingsCubitListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {
        switch (state) {
          case SettingsLoading _:
            context.showLoadingDialog();

          case SettingsError _:
            Navigator.pop(context);
           context.showErrorDialog(message: state.message.tr());

          case SettingsLogout _:
            context.pushNamedAndRemoveUntil(Routes.loginRoute);
            break;

          default:
            break;
        }
      },
      child: child,
    );
  }
}
