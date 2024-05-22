import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/core/di/dependency_injection.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/layers/presentation/addresses/cubit/addresses_cubit.dart';
import 'package:shopink/layers/presentation/addresses/ui/widgets/add_address_button.dart';
import 'package:shopink/layers/presentation/addresses/ui/widgets/addresses_body.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddressesCubit>()..getAddresses(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.addresses.tr()),
        ),
        body: const AddressesBody(),
        floatingActionButton: const AddAddressButton(),
      ),
    );
  }
}
