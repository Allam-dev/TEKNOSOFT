// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupWithEmailAndPasswordParameter
    _$SignupWithEmailAndPasswordParameterFromJson(Map<String, dynamic> json) =>
        SignupWithEmailAndPasswordParameter(
          name: json['name'] as String,
          email: json['email'] as String,
          password: json['password'] as String,
        );

Map<String, dynamic> _$SignupWithEmailAndPasswordParameterToJson(
        SignupWithEmailAndPasswordParameter instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
