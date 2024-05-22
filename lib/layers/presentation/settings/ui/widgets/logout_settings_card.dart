import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/layers/presentation/settings/cubit/settings_cubit/settings_cubit.dart';
import 'package:shopink/layers/presentation/settings/ui/widgets/settings_card.dart';

class LogoutSettingsCard extends StatelessWidget {
  const LogoutSettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsCard(
      title: LocaleKeys.logout.tr(),
      icon: Icons.logout_rounded,
      onTap: () => context.read<SettingsCubit>().logout(),
    );
  }
}
