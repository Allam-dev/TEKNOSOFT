import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopink/layers/domain/entities/address.dart';
import 'package:shopink/layers/domain/repositories/address_repo.dart';

part 'addresses_state.dart';

class AddressesCubit extends Cubit<AddressesState> {
  final AddressesRepo addressesRepo;
  AddressesCubit({required this.addressesRepo}) : super(AddressesInitial());

  Future<void> getAddresses() async {
    emit(AddressesLoading());
    final result = await addressesRepo.getAll();
    result.fold(
      (failure) => emit(AddressesError(failure.message)),
      (addresses) => emit(AddressesSuccess(addresses)),
    );
  }
}
