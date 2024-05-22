import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/core/ui/theming/text_styles.dart';

class NoDataText extends StatelessWidget {
  final String? text;
  const NoDataText({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text ?? LocaleKeys.noData.tr(),
        style: TextStyles.font17BlackNormal,
      ),
    );
  }
}
