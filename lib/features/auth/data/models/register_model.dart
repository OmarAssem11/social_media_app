import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  const RegisterModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
