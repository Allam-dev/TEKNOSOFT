import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final int quantity;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final String category;
  final double rate;

  const ProductEntity({
    required this.id,
    required this.quantity,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.rate,
  });

  @override
  List<Object?> get props => [id, name, description, imageUrl, price, category];
}
