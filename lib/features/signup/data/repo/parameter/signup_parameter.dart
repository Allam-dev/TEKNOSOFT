import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'signup_parameter.g.dart';

@JsonSerializable()
class SignupWithEmailAndPasswordParameter extends Equatable {
  final String name;
  final String email;
  final String password;

  const SignupWithEmailAndPasswordParameter({
    required this.name,
    required this.email,
    required this.password,
  });

  factory SignupWithEmailAndPasswordParameter.fromJson(Map<String, dynamic> json) =>
      _$SignupWithEmailAndPasswordParameterFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SignupWithEmailAndPasswordParameterToJson(this);

  @override
  List<Object?> get props => [name, email, password];
}
