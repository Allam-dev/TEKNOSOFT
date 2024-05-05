import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shopink/layers/domain/repositories/user_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserRepo _userRepo;
  LoginCubit(this._userRepo) : super(LoginInitial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginWithEmailAndPassword() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      final result = await _userRepo.login(
        email: emailController.text,
        password: passwordController.text,
      );

      result.fold(
        (failure) => emit(LoginError(failure.message)),
        (r) => emit(LoginSuccess()),
      );
    }
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    final result = await _userRepo.authWithGoogle();
    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (r) => emit(LoginSuccess()),
    );
  }
}
