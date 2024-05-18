import 'package:equatable/equatable.dart';

class Userdata extends Equatable {
  final String? token;
  final String? username;

  const Userdata({this.token, this.username});

  factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
        token: json['token'] as String?,
        username: json['username'] as String?,
      );

  @override
  List<Object?> get props => [token, username];
}
