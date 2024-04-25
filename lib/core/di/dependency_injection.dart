import 'package:get_it/get_it.dart';
import 'package:shopink/features/login/data/repo/login_repo.dart';
import 'package:shopink/features/login/data/repo/login_repo_firebase_imp.dart';
import 'package:shopink/features/login/logic/cubit/login_cubit.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  // ====================== Features =======================
  // ========== Login ==========
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepoFirebaseImp());
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
}
