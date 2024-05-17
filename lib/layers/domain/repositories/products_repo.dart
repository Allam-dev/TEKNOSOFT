import 'package:dartz/dartz.dart';
import 'package:shopink/core/errors/failure.dart';
import 'package:shopink/layers/domain/entities/product.dart';

abstract interface class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> filter(
      {required String category});
}
