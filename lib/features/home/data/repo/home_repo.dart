import 'package:dartz/dartz.dart';
import 'package:shopink/core/data/entity/product.dart';
import 'package:shopink/core/failures/failure.dart';

abstract interface class HomeRepo {
  Future<Either<Failure, List<ProductEntity>?>> getProducts();
  Future<Either<Failure, List<ProductEntity>?>> filter(
      {required String category});
}
