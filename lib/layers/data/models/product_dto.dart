import 'package:json_annotation/json_annotation.dart';
part 'product_dto.g.dart';

@JsonSerializable()
class ProductDTO {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  int? quantityInCart;
  RatingDTO? rating;
  ProductDTO(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.quantityInCart,
      this.image,
      this.rating});

  factory ProductDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductDTOFromJson(json);
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
        'quantityInCart': quantityInCart,
        'rating': rating?.toJson(),
      };
}

@JsonSerializable()
class RatingDTO {
  double? rate;
  int? count;

  RatingDTO({this.rate, this.count});

  factory RatingDTO.fromJson(Map<String, dynamic> json) =>
      _$RatingDTOFromJson(json);
  Map<String, dynamic> toJson() => _$RatingDTOToJson(this);
}
