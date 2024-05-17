import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopink/core/di/dependency_injection.dart';
import 'package:shopink/core/errors/failure.dart';
import 'package:shopink/core/errors/logger.dart';
import 'package:shopink/layers/data/source/remote/api/api_calls.dart';
import 'package:shopink/layers/domain/entities/product.dart';
import 'package:shopink/layers/domain/repositories/products_repo.dart';

class ProductsRepoDioImp implements ProductsRepo {
  final _apiCalls = ApiCalls(getIt<Dio>());

  @override
  Future<Either<Failure, List<ProductEntity>>> filter(
      {required String category}) {
    // TODO: implement filter
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      List<ProductEntity> products = [];
      final response = await _apiCalls.getProducts();
      for (var element in response) {
        products.add(
          ProductEntity(
            id: element.id ?? 0,
            name: element.title ?? "fake name",
            description: element.description ?? "fake description",
            imageUrl: element.image ?? "",
            price: element.price ?? 0,
            category: element.category ?? "fake category",
            rate: element.rating?.rate ?? 0,
            quantityInCart: 0,
          ),
        );
      }
      return Right(products);
    } catch (e) {
      Log.error(e.toString());
      return Left(Failure.fromException(exception: e));
    }
  }
}
