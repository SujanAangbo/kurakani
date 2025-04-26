import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  double? height;
  double? width;
  bool isCircle;

  Skeleton({
    super.key,
    this.height,
    this.width,
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        color: Colors.grey.withOpacity(0.2),
      ),
    );
  }
}
