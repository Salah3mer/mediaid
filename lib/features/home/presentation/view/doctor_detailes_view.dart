import 'package:flutter/material.dart';
import 'package:mediaid/features/home/data/models/home_model/doctor.dart';
import 'package:mediaid/features/home/presentation/view/widgets/detailes_view_body.dart';

class DoctorDetailsView extends StatelessWidget {
  final Doctor doctor;

  const DoctorDetailsView({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DetailesViewBody(doctor: doctor));
  }
}
