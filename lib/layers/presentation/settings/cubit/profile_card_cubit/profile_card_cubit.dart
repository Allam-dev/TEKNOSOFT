import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopink/core/errors/failure.dart';
import 'package:shopink/layers/domain/entities/user.dart';
import 'package:shopink/layers/domain/repositories/user_repo.dart';

part 'profile_card_state.dart';

class ProfileCardCubit extends Cubit<ProfileCardState> {
  final UserRepo userRepo;

  ProfileCardCubit({required this.userRepo}) : super(ProfileCardInitial());

  Future<void> getUser() async {
    emit(ProfileCardLoading());
    final result = await userRepo.getProfile();
    result.fold(
      (failure) {
        if (failure.type == FailureType.unauthorized) {
          emit(ProfileCardUnauthrizedError());
        } else {
          emit(ProfileCardError(failure.message));
        }
      },
      (user) => emit(ProfileCardSuccess(user)),
    );
  }
}
