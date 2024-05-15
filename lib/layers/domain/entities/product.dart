class ProductEntity {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final String category;
  final double rate;
  final int quantityInCart;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.rate,
    required this.quantityInCart,
  });

  @override
  String toString() {
    return 'ProductEntity(id: $id, name: $name, description: $description, imageUrl: $imageUrl, price: $price, category: $category, rate: $rate, quantityInCart: $quantityInCart)';
  }

  ProductEntity copyWith({
    int? id,
    String? name,
    String? description,
    String? imageUrl,
    double? price,
    String? category,
    double? rate,
    int? quantityInCart,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      category: category ?? this.category,
      rate: rate ?? this.rate,
      quantityInCart: quantityInCart ?? this.quantityInCart,
    );
  }
}
