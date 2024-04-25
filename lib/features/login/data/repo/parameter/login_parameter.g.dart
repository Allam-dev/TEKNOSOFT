// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginWithEmailAndPasswordParameter _$LoginWithEmailAndPasswordParameterFromJson(
        Map<String, dynamic> json) =>
    LoginWithEmailAndPasswordParameter(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginWithEmailAndPasswordParameterToJson(
        LoginWithEmailAndPasswordParameter instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
