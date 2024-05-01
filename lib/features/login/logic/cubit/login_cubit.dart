import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shopink/features/login/data/repo/login_repo.dart';
import 'package:shopink/features/login/data/repo/parameter/login_parameter.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginInitial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginWithEmailAndPassword() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      final result = await _loginRepo.loginWithEmailAndPassword(
        LoginWithEmailAndPasswordParameter(
            email: emailController.text, password: passwordController.text),
      );

      result.fold(
        (failure) => emit(LoginError(failure.message)),
        (r) => emit(LoginSuccess()),
      );
    }
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    final result = await _loginRepo.loginWithGoogle();
    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (r) => emit(LoginSuccess()),
    );
  }
}
