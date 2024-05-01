import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shopink/features/signup/data/repo/parameter/signup_parameter.dart';
import 'package:shopink/features/signup/data/repo/singup_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;

  SignupCubit(this._signupRepo) : super(SignupInitial());

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> signupWithEmailAndPassword() async {
    if (formKey.currentState!.validate()) {
      emit(SignupLoading());
      final result = await _signupRepo.signupWithEmailAndPassword(
        SignupWithEmailAndPasswordParameter(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      result.fold(
        (failure) => emit(SignupError(failure.message)),
        (r) => emit(SignupSuccess()),
      );
    }
  }

  Future<void> signupWithGoogle() async {
    emit(SignupLoading());
    final result = await _signupRepo.signupWithGoogle();
    result.fold(
      (failure) => emit(SignupError(failure.message)),
      (r) => emit(SignupSuccess()),
    );
  }
}
