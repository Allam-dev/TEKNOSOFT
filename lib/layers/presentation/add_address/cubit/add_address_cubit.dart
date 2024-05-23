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
  final titleController = TextEditingController();
  final streetController = TextEditingController();
  final cityController = TextEditingController();
  final governorateController = TextEditingController();

  void addAddress() async {
    if (formKey.currentState!.validate()) {
      emit(AddAddressLoading());
      final result = await addressesRepo.add(
        AddressEntity(
          title: titleController.text,
          street: streetController.text,
          city: cityController.text,
          governorate: governorateController.text,
        ),
      );
      result.fold(
        (failure) => emit(AddAddressError(failure.message)),
        (address) => emit(AddAddressSuccess()),
      );
    }
  }
}
