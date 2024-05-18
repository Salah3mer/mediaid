import 'package:flutter/material.dart';
import 'package:mediaid/config/app_colors.dart';
import 'package:mediaid/config/constants.dart';

class SpecialityItem extends StatelessWidget {
  final int index;
  final String title;
  const SpecialityItem({
    super.key,
    required this.index,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CircleAvatar(
        radius: 40,
        backgroundColor: (AppColors.specialityBackColor),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.network(
              fit: BoxFit.cover, AppConstans.specialityImageUrl[index]),
        ),
      ),
      Text(title),
    ]);
  }
}
