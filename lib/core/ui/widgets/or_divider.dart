import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/core/ui/theming/text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            height: 1,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
        ),
        Text(
          LocaleKeys.or.tr(),
          style: TextStyles.font15GrayNormal,
        ),
        const Expanded(
          child: Divider(
            height: 1,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
        ),
      ],
    );
  }
}
