import 'package:dartz/dartz.dart';
import 'package:shopink/layers/domain/entities/product.dart';
import 'package:shopink/core/failures/failure.dart';

abstract interface class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> filter(
      {required String category});
}
