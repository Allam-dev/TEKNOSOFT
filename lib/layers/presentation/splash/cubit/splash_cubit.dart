import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void checkLoginStatus() {
    if (FirebaseAuth.instance.currentUser == null) {
      emit(SplashLoggedOut());
    } else {
      emit(SplashLoggedin());
    }
    log('hi');
  }
}
