import 'package:equatable/equatable.dart';

import 'user_data.dart';

class AuthResponceBodyModel extends Equatable {
  final String? message;
  final Userdata? userData;
  final bool? status;
  final int? code;

  const AuthResponceBodyModel({
    this.message,
    this.userData,
    this.status,
    this.code,
  });

  factory AuthResponceBodyModel.fromJson(Map<String, dynamic> json) {
    return AuthResponceBodyModel(
      message: json['message'] as String?,
      userData: json['data'] == null
          ? null
          : Userdata.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as bool?,
      code: json['code'] as int?,
    );
  }

  @override
  List<Object?> get props => [message, userData, status, code];
}
