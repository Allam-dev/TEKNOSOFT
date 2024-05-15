import 'package:json_annotation/json_annotation.dart';
import 'package:shopink/layers/data/models/product_response.dart';
part 'cart_response.g.dart';

@JsonSerializable()
class CartResponse {
  double? price;
  @JsonKey(name: "items")
  int? count;
  List<ProductResponse>? products;

  CartResponse({this.price, this.count, this.products});

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
  Map<String, dynamic> toJson() => <String, dynamic>{
        'price': price,
        'items': count,
        'products': products?.map((e) => e.toJson()).toList(),
      };
}
