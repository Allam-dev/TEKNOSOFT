import 'package:get_it/get_it.dart';
import 'package:shopink/features/login/data/repo/login_repo.dart';
import 'package:shopink/features/login/data/repo/login_repo_firebase_imp.dart';
import 'package:shopink/features/login/logic/cubit/login_cubit.dart';
import 'package:shopink/features/signup/data/repo/signup_repo_firebase_imp.dart';
import 'package:shopink/features/signup/data/repo/singup_repo.dart';
import 'package:shopink/features/signup/logic/cubit/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  // ====================== Features =======================
        // ========== Login ==========
        getIt.registerFactory<LoginRepoFirebaseImp>(() => LoginRepoFirebaseImp());
        getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepoFirebaseImp>()));

        // ========== Signup ==========
        getIt.registerFactory<SignupRepoFirebaseImp>(() => SignupRepoFirebaseImp());
        getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<SignupRepoFirebaseImp>()));
}
