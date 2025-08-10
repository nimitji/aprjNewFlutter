import 'package:flutter/material.dart';
import '../Constants/app_color.dart';
import '../Constants/size.dart';


class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback? press;
  final bool? isIcon;
  final String? icon;
  final Color? color;
  final Color? iconColor;
  final double? widthValue;

  const CustomButton(
      {this.text,
      this.icon,
      this.isIcon = false,
      this.color = kPrimaryColor,
      this.iconColor = kdarktext,
      @required this.widthValue,
      this.press});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getScreeWidth(widthValue!),
      height: getScreenHeight(45),
      child: ElevatedButton.icon(
        icon: isIcon!
            ? SizedBox()
            : SizedBox(),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: press,
        label: Text(
          text!,
        ),
      ),
    );
  }
}
