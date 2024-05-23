import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopink/core/ui/widgets/no_products_text.dart';
import 'package:shopink/layers/domain/entities/address.dart';
import 'package:shopink/layers/presentation/addresses/cubit/addresses_cubit.dart';

class AddressesBody extends StatelessWidget {
  const AddressesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressesCubit, AddressesState>(
      builder: (context, state) {
        switch (state) {
          case AddressesSuccess _:
            return _SuccessState(state.addresses);
          case AddressesError _:
            return _ErrorState(state.message);
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _SuccessState extends StatelessWidget {
  final List<AddressEntity> _addresses;
  const _SuccessState(this._addresses);

  @override
  Widget build(BuildContext context) {
    if (_addresses.isEmpty) {
      return const NoDataText();
    } else {
      return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        itemCount: _addresses.length,
        itemBuilder: (context, index) {
          final address = _addresses[index];
          return Card(
            child: ListTile(
              title: Text(address.title),
              subtitle: Text(
                  "${address.governorate}/${address.city}\n${address.street}"),
            ),
          );
        },
      );
    }
  }
}

class _ErrorState extends StatelessWidget {
  final String _message;
  const _ErrorState(this._message);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(_message));
  }
}
