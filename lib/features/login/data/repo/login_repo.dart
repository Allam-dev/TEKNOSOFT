import 'package:dartz/dartz.dart';
import 'package:shopink/core/failures/failure.dart';
import 'package:shopink/features/login/data/repo/parameter/login_parameter.dart';

abstract interface class LoginRepo {
  Future<Either<Failure, void>> loginWithEmailAndPassword(
      LoginWithEmailAndPasswordParameter loginParameter);

  Future<Either<Failure, void>> loginWithGoogle();
}
