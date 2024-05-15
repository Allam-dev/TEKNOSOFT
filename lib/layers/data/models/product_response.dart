import 'package:json_annotation/json_annotation.dart';
part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  int? quantityInCart;
  RatingResponse? rating;
  ProductResponse(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.quantityInCart,
      this.image,
      this.rating});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
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
class RatingResponse {
  double? rate;
  int? count;

  RatingResponse({this.rate, this.count});

  factory RatingResponse.fromJson(Map<String, dynamic> json) =>
      _$RatingResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RatingResponseToJson(this);
}
