import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/core/ui/theming/text_styles.dart';
import 'package:shopink/core/ui/widgets/app_button.dart';
import 'package:shopink/layers/presentation/add_address/cubit/add_address_cubit.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      child: Text(
        LocaleKeys.add.tr(),
        style: TextStyles.font17BlackNormal,
      ),
      onPressed: () {
        context.read<AddAddressCubit>().addAddress();
      },
    );
  }
}
