import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopink/core/data/source/remote/firebase/firebase_error_handler.dart';
import 'package:shopink/core/failures/failure.dart';

import 'login_repo.dart';
import 'parameter/login_parameter.dart';

class LoginRepoFirebaseImp implements LoginRepo {
  final _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<Either<Failure, void>> loginWithEmailAndPassword(
      LoginWithEmailAndPasswordParameter loginParameter) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: loginParameter.email, password: loginParameter.password);
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(
          Failure(exception: e, userMessage: FirebaseErrorHandler.handle(e)));
    } catch (e) {
      return Left(
          Failure(exception: e as Exception, userMessage: e.toString()));
    }
  }
}
