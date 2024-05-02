// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeProductResponse _$HomeProductResponseFromJson(Map<String, dynamic> json) =>
    HomeProductResponse(
      id: json['id'] as int?,
      name: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      category: json['category'] as String?,
      image: json['image'] as String?,
      rating: json['rating'] == null
          ? null
          : HomeProductRating.fromJson(json['rating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeProductResponseToJson(
        HomeProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.name,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'rating': instance.rating,
    };

HomeProductRating _$HomeProductRatingFromJson(Map<String, dynamic> json) =>
    HomeProductRating(
      rate: (json['rate'] as num?)?.toDouble(),
      count: json['count'] as int?,
    );

Map<String, dynamic> _$HomeProductRatingToJson(HomeProductRating instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'count': instance.count,
    };
