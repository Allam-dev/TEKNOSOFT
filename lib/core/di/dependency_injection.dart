import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shopink/core/data/source/remote/api/constants.dart';
import 'package:shopink/features/home/data/repo/home_repo_dio_imp.dart';
import 'package:shopink/features/home/logic/cubit/home_cubit.dart';
import 'package:shopink/features/login/data/repo/login_repo_firebase_imp.dart';
import 'package:shopink/features/login/logic/cubit/login_cubit.dart';
import 'package:shopink/features/signup/data/repo/signup_repo_firebase_imp.dart';
import 'package:shopink/features/signup/logic/cubit/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  // ====================== Core =======================
  // ========== Api ==========
  getIt.registerLazySingleton<Dio>(
    () {
      final dio = Dio();
      dio.options.connectTimeout = const Duration(seconds: 30);
      dio.options.receiveTimeout = const Duration(seconds: 30);
      dio.options.baseUrl = ApiEndpoints.baseUrl;
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          responseHeader: true,
          requestBody: true,
        ),
      );
      return dio;
    },
  );

  // ========== Local Storage ==========

  // ====================== Features =======================
  // ========== Login ==========
  getIt.registerFactory<LoginRepoFirebaseImp>(() => LoginRepoFirebaseImp());
  getIt.registerFactory<LoginCubit>(
      () => LoginCubit(getIt<LoginRepoFirebaseImp>()));

  // ========== Signup ==========
  getIt.registerFactory<SignupRepoFirebaseImp>(() => SignupRepoFirebaseImp());
  getIt.registerFactory<SignupCubit>(
      () => SignupCubit(getIt<SignupRepoFirebaseImp>()));

  // ========== Home ==========
  getIt.registerFactory<HomeRepoDioImp>(() => HomeRepoDioImp());
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepoDioImp>()));
}
