import 'package:flutter/material.dart';
import 'package:qr_code_demo/app/styles/app_color.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    Key? key,
    this.height,
    this.width,
    this.radius,
    this.edgeInsetsGeometry,
    this.color = AppColors.whiteColor,
  }) : super(key: key);

  final double? height, width, radius;
  final EdgeInsetsGeometry? edgeInsetsGeometry;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: edgeInsetsGeometry,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? 0.0),
        ),
      ),
    );
  }
}
