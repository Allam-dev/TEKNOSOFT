import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shopink/layers/domain/entities/cart.dart';
import 'package:shopink/layers/domain/repositories/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  CartCubit({
    required this.cartRepo,
  }) : super(CartInitial());

  void getCart() {
    cartRepo.getCart().stream.listen(
      (result) {
        result.fold(
          (failure) => emit(CartError(failure.message)),
          (cartEntity) => emit(CartSuccess(cartEntity)),
        );
      },
    );
  }

  Future<void> deleteProduct(int productId) async {
    final result = await cartRepo.deleteProduct(productId: productId);

    result.fold(
      (failure) => emit(CartError(failure.message)),
      (r) => null,
    );
  }

  Future<void> incrementProduct(int productId) async {
    final result = await cartRepo.incrementProduct(productId: productId);
    result.fold(
      (failure) => emit(CartError(failure.message)),
      (r) => null,
    );
  }

  Future<void> decrementProduct(int productId) async {
    final result = await cartRepo.decrementProduct(productId: productId);
    result.fold(
      (failure) => emit(CartError(failure.message)),
      (r) => null,
    );
  }

  Future<void> deleteCart() async {
    emit(CartLoading());
    final result = await cartRepo.deleteCart();
    result.fold(
      (failure) => emit(CartError(failure.message)),
      (r) => null,
    );
  }

  @override
  Future<void> close() {
    cartRepo.getCart().close();
    return super.close();
  }
}
