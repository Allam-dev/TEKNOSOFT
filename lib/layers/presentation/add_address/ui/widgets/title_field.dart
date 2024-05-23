import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/core/extensions/string/validations.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/layers/presentation/add_address/cubit/add_address_cubit.dart';

class AddAddressTitleField extends StatelessWidget {
  const AddAddressTitleField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context.read<AddAddressCubit>().titleController,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      validator: (value) => value!.isName() ? null : LocaleKeys.invalid.tr(),
      decoration: InputDecoration(
        hintText: LocaleKeys.title.tr(),
      ),
    );
  }
}