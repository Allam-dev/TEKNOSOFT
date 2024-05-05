import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shopink/layers/domain/repositories/user_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final UserRepo _userRepo;

  SignupCubit(this._userRepo) : super(SignupInitial());

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> signupWithEmailAndPassword() async {
    if (formKey.currentState!.validate()) {
      emit(SignupLoading());
      final result = await _userRepo.signup(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      result.fold(
        (failure) => emit(SignupError(failure.message)),
        (r) => emit(SignupSuccess()),
      );
    }
  }

  Future<void> signupWithGoogle() async {
    emit(SignupLoading());
    final result = await _userRepo.authWithGoogle();
    result.fold(
      (failure) => emit(SignupError(failure.message)),
      (r) => emit(SignupSuccess()),
    );
  }
}
