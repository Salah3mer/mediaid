import 'package:intl/intl.dart';
import 'package:mediaid/features/home/data/models/home_model/datum.dart';
import 'package:mediaid/features/home/data/models/home_model/doctor.dart';

String refactorTime(String time) {
  DateTime dateTime = DateFormat('HH:mm:ss').parse(time);
  String formatedTime = DateFormat('HH:mm a').format(dateTime);
  return formatedTime;
}

List<List<Doctor>?> doctors(List<Datum> data) {
  return data.map((e) => e.doctors).toList();
}
