part of 'addresses_cubit.dart';

@immutable
sealed class AddressesState {}

final class AddressesInitial extends AddressesState {}

final class AddressesLoading extends AddressesState {}

final class AddressesSuccess extends AddressesState {
  final List<AddressEntity> addresses; 

  AddressesSuccess(this.addresses);
}

final class AddressesError extends AddressesState {
  final String message;

  AddressesError(this.message);
}
