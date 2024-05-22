// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartDTO _$CartDTOFromJson(Map<String, dynamic> json) => CartDTO(
      price: (json['price'] as num?)?.toDouble(),
      count: (json['items'] as num?)?.toInt(),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartDTOToJson(CartDTO instance) => <String, dynamic>{
      'price': instance.price,
      'items': instance.count,
      'products': instance.products,
    };
