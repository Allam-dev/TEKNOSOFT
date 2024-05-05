import 'package:json_annotation/json_annotation.dart';
part 'cart_response.g.dart';

@JsonSerializable()
class CartResponse {
  int? price;
  @JsonKey(name: "items")
  int? count;
  List<CartProductResponse>? products;

  CartResponse({this.price, this.count, this.products});

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
  Map<String, dynamic> toJson() => <String, dynamic>{
        'price': price,
        'items': count,
        'products': products?.map((e) => e.toJson()).toList(),
      };
}

@JsonSerializable()
class CartProductResponse {
  int? id;
  String? name;
  String? description;
  String? category;
  String? imageUrl;
  int? quantity;
  double? price;
  double? rate;

  CartProductResponse({
    this.id,
    this.name,
    this.category,
    this.description,
    this.imageUrl,
    this.price,
    this.rate,
    this.quantity,
  });

  factory CartProductResponse.fromJson(Map<String, dynamic> json) =>
      _$CartProductResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CartProductResponseToJson(this);
}
