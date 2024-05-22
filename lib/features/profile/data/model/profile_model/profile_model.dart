import 'package:equatable/equatable.dart';

import 'profile_data.dart';

class ProfileModel extends Equatable {
  final String? message;
  final List<ProfileData>? data;
  final bool? status;
  final int? code;

  const ProfileModel({this.message, this.data, this.status, this.code});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => ProfileData.fromJson(e as Map<String, dynamic>))
            .toList(),
        status: json['status'] as bool?,
        code: json['code'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
        'status': status,
        'code': code,
      };

  @override
  List<Object?> get props => [message, data, status, code];
}
