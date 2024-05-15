// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      category: json['category'] as String?,
      quantityInCart: (json['quantityInCart'] as num?)?.toInt(),
      image: json['image'] as String?,
      rating: json['rating'] == null
          ? null
          : RatingResponse.fromJson(json['rating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'quantityInCart': instance.quantityInCart,
      'rating': instance.rating,
    };

RatingResponse _$RatingResponseFromJson(Map<String, dynamic> json) =>
    RatingResponse(
      rate: (json['rate'] as num?)?.toDouble(),
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RatingResponseToJson(RatingResponse instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'count': instance.count,
    };
