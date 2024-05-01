import 'package:dartz/dartz.dart';
import 'package:shopink/core/failures/failure.dart';
import 'package:shopink/features/signup/data/repo/parameter/signup_parameter.dart';

abstract interface class SignupRepo {
  Future<Either<Failure, void>> signupWithEmailAndPassword(
      SignupWithEmailAndPasswordParameter signupParameter);

  Future<Either<Failure, void>> signupWithGoogle();
}
