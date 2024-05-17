part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class SettingsLoading extends SettingsState {}

final class SettingsSuccess extends SettingsState {
  final UserEntity user;
  SettingsSuccess(this.user);
}



final class SettingsError extends SettingsState {
  final String message;
  SettingsError(this.message);
}

final class SettingsLogout extends SettingsState {}

final class SettingsUnauthrizedError extends SettingsState {}
