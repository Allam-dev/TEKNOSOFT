import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shopink/core/di/dependency_injection.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/layers/presentation/settings/cubit/settings_cubit/settings_cubit.dart';
import 'package:shopink/layers/presentation/settings/ui/widgets/addresses_settings_card.dart';
import 'package:shopink/layers/presentation/settings/ui/widgets/contact_us_settings_card.dart';
import 'package:shopink/layers/presentation/settings/ui/widgets/language_settings_card.dart';
import 'package:shopink/layers/presentation/settings/ui/widgets/logout_settings_card.dart';
import 'package:shopink/layers/presentation/settings/ui/widgets/privacy_settings_card.dart';
import 'package:shopink/layers/presentation/settings/ui/widgets/profile_card.dart';
import 'package:shopink/layers/presentation/settings/ui/widgets/settings_cubit_listener.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => getIt<SettingsCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.settings.tr()),
        ),
        body: SettingsCubitListener(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ProfileCard(),
                Gap(40.h),
                const LanguageSettingsCard(),
                Gap(20.h),
                const AddressesSettingsCard(),
                Gap(20.h),
                const PrivacySettingsCard(),
                Gap(20.h),
                const ContactUsSettingsCard(),
                Gap(20.h),
                const LogoutSettingsCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
