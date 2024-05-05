import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/core/ui/theming/text_styles.dart';


class LoginWelcomeText extends StatelessWidget {
  const LoginWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          LocaleKeys.welcome.tr(),
          style: TextStyles.font32BlackBold,
        ),
        Text(
          LocaleKeys.signInToContinue.tr(),
          style: TextStyles.font15GrayNormal,
        ),
      ],
    );
  }
}
