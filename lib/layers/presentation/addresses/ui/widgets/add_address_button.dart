import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/core/extensions/context/navigation.dart';
import 'package:shopink/core/routing/routes.dart';
import 'package:shopink/layers/presentation/addresses/cubit/addresses_cubit.dart';

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({super.key});

  @override
  Widget build(BuildContext context) {
    final addressesCubit = context.read<AddressesCubit>();
    return FloatingActionButton(
      onPressed: () async {
        bool? reload = await context.pushNamed(Routes.addAddressRoute) as bool?;
        if (reload == true) {
          addressesCubit.getAddresses();
        }
      },
      child: const Icon(Icons.add),
    );
  }
}
