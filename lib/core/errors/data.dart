import 'package:equatable/equatable.dart';

class ErrorData extends Equatable {
  final List<dynamic>? name;
  final List<dynamic>? email;
  final List<dynamic>? phone;
  final List<dynamic>? gender;
  final List<dynamic>? password;

  const ErrorData({
    this.name,
    this.email,
    this.phone,
    this.gender,
    this.password,
  });

  factory ErrorData.fromJson(Map<String, dynamic> json) => ErrorData(
        name: json['name'] as List<dynamic>?,
        email: json['email'] as List<dynamic>?,
        phone: json['phone'] as List<dynamic>?,
        gender: json['gender'] as List<dynamic>?,
        password: json['password'] as List<dynamic>?,
      );

  @override
  List<Object?> get props => [name, email, phone, gender, password];
}
