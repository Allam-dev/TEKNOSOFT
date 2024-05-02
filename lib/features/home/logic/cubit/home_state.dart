part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<ProductEntity>? products;
  const HomeSuccess(this.products);
}

final class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);
}
