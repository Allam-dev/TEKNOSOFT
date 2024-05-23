import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/core/extensions/context/navigation.dart';
import 'package:shopink/core/extensions/context/showing.dart';
import 'package:shopink/layers/presentation/add_address/cubit/add_address_cubit.dart';

class AddAddressCubitListener extends StatelessWidget {
  final Widget child;
  const AddAddressCubitListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddAddressCubit, AddAddressState>(
      listener: (context, state) {
        switch (state) {
          case AddAddressLoading _:
            context.showLoadingDialog();

          case AddAddressSuccess _:
            context.pop();
            context.pop(true);

          case AddAddressError _:
            context.pop();
            context.showErrorDialog(message: state.message.tr());

          default:
            break;
        }
      },
      child: child,
    );
  }
}
