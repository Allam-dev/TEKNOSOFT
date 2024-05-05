class ProductEntity {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final String category;
  final double rate;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.rate,
  });
}
