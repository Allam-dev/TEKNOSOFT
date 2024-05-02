import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopink/core/data/entity/product.dart';
import 'package:shopink/core/data/source/remote/api/constants.dart';
import 'package:shopink/core/di/dependency_injection.dart';
import 'package:shopink/core/failures/failure.dart';
import 'package:shopink/core/failures/logger.dart';
import 'package:shopink/features/home/data/model/home_products_response.dart';
import 'package:shopink/features/home/data/repo/home_repo.dart';
part 'home_repo_dio_imp.g.dart';

class HomeRepoDioImp implements HomeRepo {
  final _retrofit = _HomeRepoRetrofit(getIt<Dio>());

  @override
  Future<Either<Failure, List<ProductEntity>?>> filter(
      {required String category}) {
    // TODO: implement filter
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>?>> getProducts() async {
    try {
      List<ProductEntity> products = [];
      final response = await _retrofit.getProducts();
      response?.forEach(
        (element) {
          products.add(
            ProductEntity(
              id: element.id ?? 0,
              quantity: 0,
              name: element.name ?? "fake name",
              description: element.description ?? "fake description",
              imageUrl: element.image ?? "",
              price: element.price ?? 0,
              category: element.category ?? "fake category",
              rate: element.rating?.rate ?? 0,
            ),
          );
        },
      );
      return Right(products);
    } catch (e) {
      Log.error(e.toString());
      return Left(Failure(exception: e));
    }
  }
}

@RestApi()
abstract class _HomeRepoRetrofit {
  factory _HomeRepoRetrofit(Dio dio, {String baseUrl}) = __HomeRepoRetrofit;

  @GET(ApiEndpoints.products)
  Future<List<HomeProductResponse>?> getProducts();
}
