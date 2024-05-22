import 'package:json_annotation/json_annotation.dart';
import 'package:shopink/layers/data/models/product_dto.dart';
part 'cart_dto.g.dart';

@JsonSerializable()
class CartDTO {
  double? price;
  @JsonKey(name: "items")
  int? count;
  List<ProductDTO>? products;

  CartDTO({this.price, this.count, this.products});

  factory CartDTO.fromJson(Map<String, dynamic> json) =>
      _$CartDTOFromJson(json);
  Map<String, dynamic> toJson() => <String, dynamic>{
        'price': price,
        'items': count,
        'products': products?.map((e) => e.toJson()).toList(),
      };
}
