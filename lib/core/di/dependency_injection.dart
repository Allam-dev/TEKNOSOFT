import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shopink/layers/data/repositories_imp/cart/cart_repo_firebase_imp.dart';
import 'package:shopink/layers/data/repositories_imp/orders/orders_repo_firebase_imp.dart';
import 'package:shopink/layers/data/repositories_imp/products/products_repo_dio_imp.dart';
import 'package:shopink/layers/data/repositories_imp/user/user_repo_firebase_imp.dart';
import 'package:shopink/layers/data/source/remote/api/constants.dart';
import 'package:shopink/layers/domain/repositories/cart_repo.dart';
import 'package:shopink/layers/domain/repositories/orders_repo.dart';
import 'package:shopink/layers/domain/repositories/products_repo.dart';
import 'package:shopink/layers/domain/repositories/user_repo.dart';
import 'package:shopink/layers/presentation/cart/cubit/cart_cubit.dart';
import 'package:shopink/layers/presentation/home/cubit/home_cubit.dart';
import 'package:shopink/layers/presentation/login/cubit/login_cubit.dart';
import 'package:shopink/layers/presentation/signup/cubit/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  // ====================== Core =======================
  // ========== Api ==========
  getIt.registerLazySingleton<Dio>(
    () {
      final dio = Dio();
      dio.options.connectTimeout = const Duration(seconds: 30);
      dio.options.receiveTimeout = const Duration(seconds: 30);
      dio.options.baseUrl = ApiCostants.baseUrl;
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

  // ====================== Leyers =======================
  // ========== repositories ==========
  getIt.registerLazySingleton<UserRepo>(() => UserRepoFirebaseImp());
  getIt.registerLazySingleton<CartRepo>(() => CartRepoFirebaseImp());
  getIt.registerLazySingleton<ProductsRepo>(() => ProductsRepoDioImp());
  getIt.registerLazySingleton<OrdersRepo>(() => OrdersRepoFirebaseImp());

  // ========== cubits ==========
  getIt.registerFactory<LoginCubit>(() => LoginCubit(userRepo: getIt<UserRepo>()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(userRepo:  getIt<UserRepo>()));
  getIt.registerFactory<HomeCubit>(
      () => HomeCubit(productsRepo: getIt<ProductsRepo>()));
  getIt
      .registerFactory<CartCubit>(() => CartCubit(cartRepo: getIt<CartRepo>()));
}
