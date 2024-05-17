import 'package:dartz/dartz.dart';
import 'package:shopink/core/errors/failure.dart';
import 'package:shopink/layers/domain/entities/order.dart';
import 'package:shopink/layers/domain/repositories/orders_repo.dart';

class OrdersRepoFirebaseImp implements OrdersRepo {
  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders() {
    // TODO: implement getOrders
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrderEntity>> getOrderDetails() {
    // TODO: implement getOrderDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrderEntity>> makeOrder(OrderEntity order) {
    // TODO: implement makeOrder
    throw UnimplementedError();
  }
}
