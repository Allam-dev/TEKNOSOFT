import 'package:dartz/dartz.dart';
import 'package:shopink/core/errors/failure.dart';
import 'package:shopink/layers/domain/entities/user.dart';

abstract interface class UserRepo {
  Future<Either<Failure, void>> login(
      {required String email, required String password});

  Future<Either<Failure, void>> signup(
      {required String name, required String email, required String password});

  Future<Either<Failure, void>> authWithGoogle();

  Future<Either<Failure, void>> updateProfile({required UserEntity user});

  Future<Either<Failure, void>> changePassword(
      {required String oldPassword, required String newPassword});

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, void>> forgotPassword();

  Future<Either<Failure, UserEntity>> getProfile();
}
