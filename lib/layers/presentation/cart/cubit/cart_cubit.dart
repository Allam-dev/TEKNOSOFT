import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shopink/layers/domain/entities/cart.dart';
import 'package:shopink/layers/domain/repositories/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;
  CartCubit(this._cartRepo) : super(CartInitial());

  Future<void> getCart() async {
    emit(CartLoading());
    final result = await _cartRepo.getCart();
    result.fold(
      (failure) => emit(CartError(failure.message)),
      (cartEntity) => emit(CartSuccess(cartEntity)),
    );
  }
}
