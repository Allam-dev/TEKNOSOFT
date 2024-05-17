import 'package:dartz/dartz.dart';
import 'package:shopink/core/errors/failure.dart';
import 'package:shopink/layers/domain/entities/address.dart';

abstract interface class AddressRepo {
  Future<Either<Failure, List<AddressEntity>>> getAll();
  Future<Either<Failure, void>> add(AddressEntity address);
  Future<Either<Failure, void>> update(int id);
  Future<Either<Failure, void>> delete(int id);
}
