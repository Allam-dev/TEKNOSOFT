import 'package:dartz/dartz.dart';
import 'package:shopink/core/failures/failure.dart';

abstract interface class UserRepo {
  Future<Either<Failure, void>> login(
      {required String email, required String password});

  Future<Either<Failure, void>> signup(
      {required String name, required String email, required String password});

  Future<Either<Failure, void>> authWithGoogle();

  Future<Either<Failure, void>> updateProfile();

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, void>> forgotPassword();

  Future<Either<Failure, void>> updatePassword();
}
