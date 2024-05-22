import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopink/core/extensions/context/navigation.dart';
import 'package:shopink/core/routing/routes.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/layers/presentation/settings/ui/widgets/settings_card.dart';

class ContactUsSettingsCard extends StatelessWidget {
  const ContactUsSettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsCard(
      title: LocaleKeys.contactUs.tr(),
      icon: Icons.call_rounded,
      onTap: () => context.pushNamed(Routes.contactUsRoute),
    );
  }
}
