import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopink/core/errors/failure.dart';
import 'package:shopink/core/errors/logger.dart';
import 'package:shopink/layers/data/models/address_dto.dart';
import 'package:shopink/layers/data/source/remote/firebase/constants.dart';
import 'package:shopink/layers/domain/entities/address.dart';
import 'package:shopink/layers/domain/repositories/address_repo.dart';

class AddressRepoFirebaseImp implements AddressesRepo {
  final _addressesPath = FirebaseFirestore.instance
      .collection(FirebaseCollections.addresses)
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection(FirebaseCollections.addresses);

  @override
  Future<Either<Failure, void>> add(AddressEntity address) async {
    try {
      final addressDTO = AddressDTO(
        city: address.city,
        governorate: address.governorate,
        street: address.street,
        title: address.title,
      );
      await _addressesPath.add(addressDTO.toJson());
      Log.info("Address added successfully");
      return const Right(null);
    } catch (e) {
      Log.error(e.toString());
      return Left(Failure.fromException(exception: e));
    }
  }

  @override
  Future<Either<Failure, void>> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<AddressEntity>>> getAll() async {
    try {
      List<AddressEntity> addresses = [];
      AddressDTO addressDTO;
      final response = await _addressesPath.get();
      if (response.docs.isNotEmpty) {
        for (var element in response.docs) {
          addressDTO = AddressDTO.fromJson(element.data());
          addresses.add(
            AddressEntity(
              city: addressDTO.city ?? "city",
              governorate: addressDTO.governorate ?? "governorate",
              street: addressDTO.street ?? "street",
              title: addressDTO.title ?? "title",
            ),
          );
        }
        Log.info("Addresses fetched successfully");
      } else {
        Log.info("No addresses found");
      }

      return Right(addresses);
    } catch (e) {
      Log.error(e.toString());
      return Left(Failure.fromException(exception: e));
    }
  }

  @override
  Future<Either<Failure, void>> update(int id) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
