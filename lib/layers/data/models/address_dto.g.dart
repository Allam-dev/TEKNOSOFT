// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDTO _$AddressDTOFromJson(Map<String, dynamic> json) => AddressDTO(
      title: json['title'] as String?,
      street: json['street'] as String?,
      city: json['city'] as String?,
      governorate: json['governorate'] as String?,
    );

Map<String, dynamic> _$AddressDTOToJson(AddressDTO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'street': instance.street,
      'city': instance.city,
      'governorate': instance.governorate,
    };
