import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopink/core/data/entity/product.dart';
import 'package:shopink/features/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeInitial());

  List<ProductEntity>? _allProducts = [];
  // final Map<String, String> _categories;

  Future<void> getProducts() async {
    if (_allProducts != null && _allProducts!.isNotEmpty) {
      emit(HomeSuccess(_allProducts));
    } else {
      emit(HomeLoading());
      final result = await _homeRepo.getProducts();
      result.fold(
        (failure) => emit(HomeError(failure.message)),
        (products) {
          _allProducts = products;
          emit(HomeSuccess(products));
        },
      );
    }
  }

  Future<void> filter({required String category}) async {
    emit(HomeLoading());

    final result = await _homeRepo.filter(category: category);
    result.fold(
      (failure) => emit(HomeError(failure.message)),
      (products) => emit(HomeSuccess(products)),
    );
  }
}
