import 'package:equatable/equatable.dart';
import 'package:mediaid/core/errors/data.dart';

class ApiErrorModel extends Equatable {
  final String? message;
  final ErrorData? data;
  final bool? status;
  final int? code;

  const ApiErrorModel({this.message, this.data, this.status, this.code});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : ErrorData.fromJson(json['data'] as Map<String, dynamic>),
        status: json['status'] as bool?,
        code: json['code'] as int?,
      );

  @override
  List<Object?> get props => [message, data, status, code];
}
