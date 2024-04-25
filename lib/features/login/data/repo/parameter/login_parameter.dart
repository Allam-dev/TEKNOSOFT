import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_parameter.g.dart';

@JsonSerializable()
class LoginWithEmailAndPasswordParameter extends Equatable {
  final String email;
  final String password;
  const LoginWithEmailAndPasswordParameter({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
  factory LoginWithEmailAndPasswordParameter.fromJson(
          Map<String, dynamic> json) =>
      _$LoginWithEmailAndPasswordParameterFromJson(json);
  Map<String, dynamic> toJson() => _$LoginWithEmailAndPasswordParameterToJson(this);
}
