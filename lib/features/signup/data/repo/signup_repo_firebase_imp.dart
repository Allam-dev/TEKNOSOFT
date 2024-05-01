import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopink/core/failures/failure.dart';
import 'package:shopink/core/failures/logger.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/features/signup/data/repo/parameter/signup_parameter.dart';
import 'package:shopink/features/signup/data/repo/singup_repo.dart';

class SignupRepoFirebaseImp implements SignupRepo {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, void>> signupWithEmailAndPassword(
      SignupWithEmailAndPasswordParameter signupParameter) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: signupParameter.email, password: signupParameter.password);
      // await _firebaseAuth.currentUser?.updateDisplayName(signupParameter.name);
      return const Right(null);
    } catch (e) {
      Log.error(e.toString());

      return Left(Failure(exception: e));
    }
  }

  @override
  Future<Either<Failure, void>> signupWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await _firebaseAuth.signInWithCredential(credential);
        return const Right(null);
      } else {
        Log.error('you should select google account');
        return Left(
            Failure(userMessage: LocaleKeys.youShouldSelectGoogleAccount));
      }
    } catch (e) {
      Log.error(e.toString());
      return Left(Failure(exception: e));
    }
  }
}
