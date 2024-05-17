import 'package:dartz/dartz.dart';
import 'package:shopink/core/errors/failure.dart';
import 'package:shopink/layers/domain/entities/address.dart';
import 'package:shopink/layers/domain/repositories/address_repo.dart';

class AddressRepoFirebaseImp implements AddressRepo {
  @override
  Future<Either<Failure, void>> add(AddressEntity address) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<AddressEntity>>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> update(int id) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
