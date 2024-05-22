part of 'profile_card_cubit.dart';

@immutable
sealed class ProfileCardState {}

final class ProfileCardInitial extends ProfileCardState {}

final class ProfileCardLoading extends ProfileCardState {}

final class ProfileCardError extends ProfileCardState {
  final String message;
  ProfileCardError(this.message);
}

final class ProfileCardSuccess extends ProfileCardState {
  final UserEntity user;
  ProfileCardSuccess(this.user);
}

final class ProfileCardUnauthrizedError extends ProfileCardState {}
