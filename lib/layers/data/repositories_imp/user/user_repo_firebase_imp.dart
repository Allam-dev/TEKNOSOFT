import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopink/core/errors/failure.dart';
import 'package:shopink/core/errors/logger.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/layers/domain/entities/user.dart';
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

      return Left(Failure.fromException(exception: e));
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
        return Left(Failure(
            type: FailureType.invalidInput,
            message: LocaleKeys.youShouldSelectGoogleAccount));
      }
    } catch (e) {
      Log.error(e.toString());
      return Left(Failure.fromException(exception: e));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await Future.wait([
        GoogleSignIn().signOut(),
        _firebaseAuth.signOut(),
      ]);
      return const Right(null);
    } catch (e) {
      Log.error(e.toString());
      return Left(Failure.fromException(exception: e));
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

      return Left(Failure.fromException(exception: e));
    }
  }

  @override
  Future<Either<Failure, void>> updateProfile(
      {required UserEntity user}) async {
    try {
      if (_firebaseAuth.currentUser != null) {
        await Future.wait([
          // _firebaseAuth.currentUser?.updateDisplayName(user.name),
          // _firebaseAuth.currentUser!.updatePhoneNumber(user.phone),
        ]);
        return const Right(null);
      } else {
        return Left(Failure(type: FailureType.unauthorized));
      }
    } catch (e) {
      Log.error(e.toString());

      return Left(Failure.fromException(exception: e));
    }
  }

  @override
  Future<Either<Failure, void>> changePassword(
      {required String oldPassword, required String newPassword}) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> getProfile() async {
    try {
      if (_firebaseAuth.currentUser != null) {
        return Right(UserEntity(
          id: _firebaseAuth.currentUser!.uid,
          name: _firebaseAuth.currentUser!.displayName ?? '',
          email: _firebaseAuth.currentUser!.email ?? '',
          phone: _firebaseAuth.currentUser!.phoneNumber ?? '',
          imageUrl: _firebaseAuth.currentUser!.photoURL ?? '',
        ));
      } else {
        return Left(Failure(type: FailureType.unauthorized));
      }
    } catch (e) {
      Log.error(e.toString());
      return Left(Failure.fromException(exception: e));
    }
  }
}
