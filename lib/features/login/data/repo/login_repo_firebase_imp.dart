import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopink/core/failures/failure.dart';
import 'package:shopink/core/failures/logger.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';

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
    } catch (e) {
      Log.error(e.toString());

      return Left(Failure(exception: e));
    }
  }

  @override
  Future<Either<Failure, void>> loginWithGoogle() async {
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
      }else{
        Log.error('you should select google account');
        return Left(Failure(userMessage: LocaleKeys.youShouldSelectGoogleAccount));
      }
    } catch (e) {
      Log.error(e.toString());
      return Left(Failure(exception: e));
    }
  }
}
