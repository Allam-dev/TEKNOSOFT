import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shopink/layers/domain/entities/address.dart';
import 'package:shopink/layers/domain/repositories/address_repo.dart';

part 'add_address_state.dart';

class AddAddressCubit extends Cubit<AddAddressState> {
  final AddressesRepo addressesRepo;
  AddAddressCubit({required this.addressesRepo}) : super(AddAddressInitial());

  final formKey = GlobalKey<FormState>();

  void addAddress() async {
    emit(AddAddressLoading());
    final result = await addressesRepo.add(
      AddressEntity(
        title: "title",
        street: "street",
        city: "city",
        governorate: "governorate",
      ),
    );
    result.fold(
      (failure) => emit(AddAddressError(failure.message)),
      (address) => emit(AddAddressSuccess()),
    );
  }
}
