import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shopink/core/di/dependency_injection.dart';
import 'package:shopink/core/extensions/context/navigation.dart';
import 'package:shopink/core/routing/routes.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/layers/presentation/settings/cubit/settings_cubit.dart';
import 'package:shopink/layers/presentation/settings/ui/widgets/profile_card.dart';
import 'package:shopink/layers/presentation/settings/ui/widgets/settings_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SettingsCubit>()..getUser(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.settings.tr()),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileCard(),
              Gap(40.h),
              SettingsCard(
                title: LocaleKeys.language.tr(),
                icon: Icons.language_rounded,
              ),
              Gap(20.h),
              SettingsCard(
                title: LocaleKeys.addresses.tr(),
                icon: Icons.location_on_rounded,
                onTap: () => context.pushNamed(Routes.addressesRoute),
              ),
              Gap(20.h),
              SettingsCard(
                title: LocaleKeys.privacyPolicy.tr(),
                icon: Icons.privacy_tip_rounded,
                onTap: () => context.pushNamed(Routes.privacyPolicyRoute),
              ),
              Gap(20.h),
              SettingsCard(
                title: LocaleKeys.contactUs.tr(),
                icon: Icons.call_rounded,
                onTap: () => context.pushNamed(Routes.contactUsRoute),
              ),
              Gap(20.h),
              SettingsCard(
                title: LocaleKeys.logout.tr(),
                icon: Icons.logout_rounded,
                onTap: () => context.read<SettingsCubit>().logout(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
