import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app/styles/app_color.dart';

class CustomDatePickerTextField extends StatelessWidget {
  final String title;
  final String label;
  final TextEditingController controller;
  final Widget suffixIcon;

  const CustomDatePickerTextField(
      {super.key,
      required this.label,
      required this.title,
      required this.controller,
      required this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 13.0,
              ),
        ),
        const SizedBox(height: 17.0),
        TextField(
          controller: controller,
          cursorColor: AppColors.blackColor,
          decoration: InputDecoration(
            hintText: label,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
