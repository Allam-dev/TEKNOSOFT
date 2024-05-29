import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopink/core/errors/failure.dart';
import 'package:shopink/core/errors/logger.dart';
import 'package:shopink/core/extensions/double/round.dart';
import 'package:shopink/layers/data/models/cart_dto.dart';
import 'package:shopink/layers/data/models/product_dto.dart';
import 'package:shopink/layers/data/source/remote/firebase/constants.dart';
import 'package:shopink/layers/domain/entities/cart.dart';
import 'package:shopink/layers/domain/entities/product.dart';
import 'package:shopink/layers/domain/repositories/cart_repo.dart';

class CartRepoFirebaseImp implements CartRepo {
  final _cartPath = FirebaseFirestore.instance
      .collection(FirebaseCollections.carts)
      .doc(FirebaseAuth.instance.currentUser?.uid);

  CartDTO lastCartResponse = CartDTO.fromJson({});

  @override
  StreamController<Either<Failure, CartEntity>> getCart() {
    StreamController<Either<Failure, CartEntity>> cartController =
        StreamController<Either<Failure, CartEntity>>();
    try {
      CartEntity cartEntity =
          CartEntity(totalItems: 0, totalPrice: 0, products: []);

      _cartPath.snapshots().listen((snapshot) {
        Log.info("Change in cart : ${snapshot.data()}");
        lastCartResponse = CartDTO.fromJson(snapshot.data() ?? {});

        cartEntity.totalItems = lastCartResponse.count ?? 0;
        cartEntity.totalPrice = lastCartResponse.price ?? 0;
        cartEntity.products = lastCartResponse.products
                ?.map((e) => ProductEntity(
                      quantityInCart: e.quantityInCart ?? 0,
                      id: e.id ?? 0,
                      name: e.title ?? '',
                      description: e.description ?? '',
                      imageUrl: e.image ?? '',
                      price: e.price ?? 0,
                      category: e.category ?? '',
                      rate: e.rating?.rate ?? 0,
                    ))
                .toList() ??
            [];

        cartController.add(Right(cartEntity));
      }, onError: (error) {
        Log.error(error.toString());
        cartController.add(Left(Failure.fromException(exception: error)));
      });
      return cartController;
    } catch (e) {
      Log.error(e.toString());
      cartController.add(Left(Failure.fromException(exception: e)));
      return cartController;
    }
  }

  @override
  Future<Either<Failure, void>> deleteCart() async {
    try {
      await _cartPath.delete();
      Log.info("Cart cleared successfully");
      return const Right(null);
    } catch (e) {
      Log.error(e.toString());
      return Left(Failure.fromException(exception: e));
    }
  }

  @override
  Future<Either<Failure, void>> decrementProduct(
      {required int productId}) async {
    try {
      lastCartResponse.products?.firstWhere((element) {
        if (element.id == productId) {
          if (element.quantityInCart == 1) {
            lastCartResponse.products?.remove(element);
          } else {
            element.quantityInCart = (element.quantityInCart ?? 0) - 1;
          }
          lastCartResponse.count = (lastCartResponse.count ?? 0) - 1;
          lastCartResponse.price =
              ((lastCartResponse.price ?? 0) - (element.price ?? 0))
                  .roundFractions(2);
          return true;
        } else {
          return false;
        }
      });
      await _cartPath.set(lastCartResponse.toJson());

      Log.info("Product decremented successfully from cart");
      return const Right(null);
    } catch (e) {
      Log.error(e.toString());
      return Left(Failure.fromException(exception: e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct({required int productId}) async {
    try {
      lastCartResponse.products?.removeWhere((element) {
        if (element.id == productId) {
          lastCartResponse.count =
              ((lastCartResponse.count ?? 0) - (element.quantityInCart ?? 0));
          lastCartResponse.price = ((lastCartResponse.price ?? 0) -
              ((element.price ?? 0) * (element.quantityInCart ?? 0)))
                  .roundFractions(2);
          return true;
        } else {
          return false;
        }
      });
      await _cartPath.set(lastCartResponse.toJson());

      Log.info("Product deleted successfully from cart");
      return const Right(null);
    } catch (e) {
      Log.error(e.toString());
      return Left(Failure.fromException(exception: e));
    }
  }

  @override
  Future<Either<Failure, void>> incrementProduct(
      {required int productId}) async {
    try {
      lastCartResponse.products?.firstWhere((element) {
        if (element.id == productId) {
          element.quantityInCart = (element.quantityInCart ?? 0) + 1;
          lastCartResponse.count = (lastCartResponse.count ?? 0) + 1;
          lastCartResponse.price =
              ((lastCartResponse.price ?? 0) + (element.price ?? 0))
                  .roundFractions(2);
          return true;
        } else {
          return false;
        }
      });
      await _cartPath.set(lastCartResponse.toJson());

      Log.info("Product incremented successfully to cart");
      return const Right(null);
    } catch (e) {
      Log.error(e.toString());
      return Left(Failure.fromException(exception: e));
    }
  }

  @override
  Future<Either<Failure, void>> addProduct(
      {required ProductEntity product}) async {
    try {
      product = product.copyWith(quantityInCart: product.quantityInCart + 1);
      ProductDTO productResponse = ProductDTO(
        id: product.id,
        title: product.name,
        description: product.description,
        image: product.imageUrl,
        price: product.price,
        quantityInCart: product.quantityInCart,
        category: product.category,
        rating: RatingDTO(rate: product.rate),
      );

      lastCartResponse.count =
          (lastCartResponse.count ?? 0) + product.quantityInCart;
      lastCartResponse.price = ((lastCartResponse.price ?? 0) +
              (product.price * product.quantityInCart))
          .roundFractions(2);
      if (lastCartResponse.products == null) {
        lastCartResponse.products = [productResponse];
      } else {
        lastCartResponse.products?.add(productResponse);
      }
      await _cartPath.set(lastCartResponse.toJson());
      Log.info("Product added successfully to cart");
      return const Right(null);
    } catch (e) {
      Log.error(e.toString());
      return Left(Failure.fromException(exception: e));
    }
  }
}
