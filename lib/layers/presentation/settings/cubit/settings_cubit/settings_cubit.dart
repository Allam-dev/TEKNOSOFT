import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopink/layers/domain/repositories/user_repo.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final UserRepo userRepo;
  SettingsCubit({required this.userRepo}) : super(SettingsInitial());

  Future<void> logout() async {
    emit(SettingsLoading());
    final result = await userRepo.logout();
    result.fold(
      (failure) => emit(SettingsError(failure.message)),
      (r) => emit(SettingsLogout()),
    );
  }
}
