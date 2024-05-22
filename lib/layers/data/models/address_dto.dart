import 'package:json_annotation/json_annotation.dart';

part 'address_dto.g.dart';

@JsonSerializable()
class AddressDTO {
  final String? title;
  final String? street;
  final String? city;
  final String? governorate;

  AddressDTO({
    this.title,
    this.street,
    this.city,
    this.governorate,
  });

  factory AddressDTO.fromJson(Map<String, dynamic> json) =>
      _$AddressDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDTOToJson(this);
}
