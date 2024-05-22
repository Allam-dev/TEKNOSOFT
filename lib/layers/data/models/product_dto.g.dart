// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDTO _$ProductDTOFromJson(Map<String, dynamic> json) => ProductDTO(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      category: json['category'] as String?,
      quantityInCart: (json['quantityInCart'] as num?)?.toInt(),
      image: json['image'] as String?,
      rating: json['rating'] == null
          ? null
          : RatingDTO.fromJson(json['rating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDTOToJson(ProductDTO instance) =>
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

RatingDTO _$RatingDTOFromJson(Map<String, dynamic> json) => RatingDTO(
      rate: (json['rate'] as num?)?.toDouble(),
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RatingDTOToJson(RatingDTO instance) => <String, dynamic>{
      'rate': instance.rate,
      'count': instance.count,
    };
