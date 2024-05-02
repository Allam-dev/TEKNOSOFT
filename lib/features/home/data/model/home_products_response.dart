import 'package:json_annotation/json_annotation.dart';

part 'home_products_response.g.dart';

@JsonSerializable()
class HomeProductResponse {
  int? id;
  @JsonKey(name: 'title')
  String? name;
  double? price;
  String? description;
  String? category;
  String? image;
  HomeProductRating? rating;

  HomeProductResponse(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  factory HomeProductResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeProductResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HomeProductResponseToJson(this);
}

@JsonSerializable()
class HomeProductRating {
  double? rate;
  int? count;

  HomeProductRating({this.rate, this.count});

  factory HomeProductRating.fromJson(Map<String, dynamic> json) => _$HomeProductRatingFromJson(json);
  Map<String, dynamic> toJson() => _$HomeProductRatingToJson(this);
}
