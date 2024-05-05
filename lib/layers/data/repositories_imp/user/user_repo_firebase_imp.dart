import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopink/core/failures/failure.dart';
import 'package:shopink/core/failures/logger.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/layers/domain/repositories/user_repo.dart';

class UserRepoFirebaseImp implements UserRepo {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, void>> forgotPassword() {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> login(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return const Right(null);
    } catch (e) {
      Log.error(e.toString());

      return Left(Failure(error: e));
    }
  }

  @override
  Future<Either<Failure, void>> authWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        return const Right(null);
      } else {
        Log.error('you should select google account');
        return Left(
            Failure(userMessage: LocaleKeys.youShouldSelectGoogleAccount));
      }
    } catch (e) {
      Log.error(e.toString());
      return Left(Failure(error: e));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await GoogleSignIn().signOut();
      await _firebaseAuth.signOut();
      return const Right(null);
    } catch (e) {
      Log.error(e.toString());
      return Left(Failure(error: e));
    }
  }

  @override
  Future<Either<Failure, void>> signup(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _firebaseAuth.currentUser?.updateDisplayName(name);
      return const Right(null);
    } catch (e) {
      Log.error(e.toString());

      return Left(Failure(error: e));
    }
  }

  @override
  Future<Either<Failure, void>> updatePassword() {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateProfile() {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
  
  
  
 
}
