import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/core/ui/theming/text_styles.dart';

class NoProductsText extends StatelessWidget {
  const NoProductsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        LocaleKeys.noProducts.tr(),
        style: TextStyles.font17BlackNormal,
      ),
    );
  }
}
