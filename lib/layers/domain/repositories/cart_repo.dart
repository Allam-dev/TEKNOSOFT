import 'package:dartz/dartz.dart';
import 'package:shopink/layers/domain/entities/cart.dart';
import 'package:shopink/core/failures/failure.dart';

abstract interface class CartRepo {
  Future<Either<Failure, CartEntity>> getCart();
  Future<Either<Failure, void>> updateCart(CartEntity cartEntity);
}
