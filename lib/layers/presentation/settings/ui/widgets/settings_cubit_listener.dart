import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/core/extensions/context/navigation.dart';
import 'package:shopink/core/routing/routes.dart';
import 'package:shopink/layers/presentation/settings/cubit/settings_cubit.dart';

class SettingsCubitListener extends StatelessWidget {
  final Widget child;
  const SettingsCubitListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {
        switch (state) {
          case (SettingsError _ ||
                SettingsLoading _ ||
                SettingsInitial _ ||
                SettingsSuccess _):
            break;

          case SettingsLogout _:
            context.pushNamedAndRemoveUntil(Routes.loginRoute);
            break;
          case SettingsUnauthrizedError _:
            context.read<SettingsCubit>().logout();
        }
      },
      child: child,
    );
  }
}
