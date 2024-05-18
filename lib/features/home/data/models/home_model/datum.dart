import 'package:equatable/equatable.dart';

import 'doctor.dart';

class Datum extends Equatable {
  final int? id;
  final String? name;
  final List<Doctor>? doctors;

  const Datum({this.id, this.name, this.doctors});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        name: json['name'] as String?,
        doctors: (json['doctors'] as List<dynamic>?)
            ?.map((e) => Doctor.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'doctors': doctors?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [id, name, doctors];
}
