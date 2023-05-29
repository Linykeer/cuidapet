import 'package:cuidapet/app/core/UI/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';

class CuidapetDefaultButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double radius;
  final Color? color;
  final String label;
  final Color? labelColor;
  final double labelSize;
  final double padding;
  final double width;
  final double height;
  const CuidapetDefaultButton({
    Key? key,
    required this.onPressed,
    this.radius = 10,
    this.color,
    required this.label,
    this.labelColor = Colors.white,
    this.labelSize = 20,
    this.padding = 10,
    this.width = double.infinity,
    this.height = 66,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? context.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: labelSize,
            color: labelColor,
          ),
        ),
      ),
    );
  }
}
