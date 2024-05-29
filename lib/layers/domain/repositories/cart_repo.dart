import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:shopink/core/errors/failure.dart';
import 'package:shopink/layers/domain/entities/cart.dart';
import 'package:shopink/layers/domain/entities/product.dart';

abstract interface class CartRepo {
  StreamController<Either<Failure, CartEntity>> getCart();
  Future<Either<Failure, void>> addProduct({required ProductEntity product});
  Future<Either<Failure, void>> deleteProduct({required int productId});
  Future<Either<Failure, void>> deleteCart();
  Future<Either<Failure, void>> incrementProduct({required int productId});
  Future<Either<Failure, void>> decrementProduct({required int productId});
}
