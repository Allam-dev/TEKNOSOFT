import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopink/core/failures/failure.dart';
import 'package:shopink/core/failures/logger.dart';
import 'package:shopink/layers/data/models/cart_response.dart';
import 'package:shopink/layers/data/source/remote/firebase/constants.dart';
import 'package:shopink/layers/domain/entities/cart.dart';
import 'package:shopink/layers/domain/repositories/cart_repo.dart';

class CartRepoFirebaseImp implements CartRepo {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, CartEntity>> getCart() async {
    try {
      CartEntity cartEntity =
          CartEntity(totalItems: 0, totalPrice: 0, products: []);

      final cartData = await _firebaseFirestore
          .collection(FirebaseCollections.carts)
          .doc(_firebaseAuth.currentUser?.uid)
          .get();

      if (cartData.data() != null && cartData.data()!.isNotEmpty) {
        Log.info(cartData.data().toString());

        CartResponse cartResponse =
            CartResponse.fromJson(cartData.data() ?? {});

        cartEntity.totalItems = cartResponse.count ?? 0;
        cartEntity.totalPrice = cartResponse.price ?? 0;
        cartEntity.products = cartResponse.products
                ?.map((e) => CartProductEntity(
                      quantity: e.quantity ?? 0,
                      id: e.id ?? 0,
                      name: e.name ?? '',
                      description: e.description ?? '',
                      imageUrl: e.imageUrl ?? '',
                      price: e.price ?? 0,
                      category: e.category ?? '',
                      rate: e.rate ?? 0,
                    ))
                .toList() ??
            [];
      }
      
      return Right(cartEntity);
    } catch (e) {
      Log.error(e.toString());
      return Left(Failure(error: e));
    }
  }

  @override
  Future<Either<Failure, void>> updateCart(CartEntity cartEntity) async {
    try {
      final cartPath = _firebaseFirestore
          .collection(FirebaseCollections.carts)
          .doc(_firebaseAuth.currentUser?.uid);

      CartResponse cartResponse = CartResponse(
        count: cartEntity.totalItems,
        price: cartEntity.totalPrice,
        products: cartEntity.products
            .map(
              (e) => CartProductResponse(
                id: e.id,
                name: e.name,
                description: e.description,
                imageUrl: e.imageUrl,
                price: e.price,
                quantity: e.quantity,
                category: e.category,
                rate: e.rate,
              ),
            )
            .toList(),
      );
      Log.info("Cart : ${cartResponse.toJson().toString()}");
      await cartPath.set(cartResponse.toJson());
      return const Right(null);
    } catch (e) {
      Log.error(e.toString());
      return Left(Failure(error: e));
    }
  }
}
