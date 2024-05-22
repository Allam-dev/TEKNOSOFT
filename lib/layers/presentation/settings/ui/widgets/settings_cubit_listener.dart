import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/core/extensions/context/navigation.dart';
import 'package:shopink/core/routing/routes.dart';
import 'package:shopink/core/ui/widgets/error_dialog.dart';
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
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) =>
                    const Center(child: CircularProgressIndicator()));

          case SettingsError _:
            Navigator.pop(context);
            showDialog(
                context: context,
                builder: (context) => ErrorDialog(
                      message: state.message,
                    ));

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
