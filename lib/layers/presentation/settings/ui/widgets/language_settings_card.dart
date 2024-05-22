import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/layers/presentation/settings/ui/widgets/lanuage_dialog.dart';
import 'package:shopink/layers/presentation/settings/ui/widgets/settings_card.dart';

class LanguageSettingsCard extends StatelessWidget {
  const LanguageSettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsCard(
      onTap: () => showDialog(
          context: context, builder: (context) => const LanguageDialog()),
      title: LocaleKeys.language.tr(),
      icon: Icons.language_rounded,
    );
  }
}
