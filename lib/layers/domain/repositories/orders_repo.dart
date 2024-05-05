import 'package:dartz/dartz.dart';
import 'package:shopink/core/failures/failure.dart';
import 'package:shopink/layers/domain/entities/order.dart';

abstract interface class OrdersRepo {
  Future<Either<Failure, List<OrderEntity>>> getOrders();

  Future<Either<Failure, OrderEntity>> makeOrder(OrderEntity order);

  Future<Either<Failure, OrderEntity>> getOrderDetails();
}
