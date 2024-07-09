import 'package:flutter/material.dart';

class SessionTypeWidget extends StatelessWidget {
  const SessionTypeWidget({
    super.key,
    this.color = Colors.grey,
    this.textColor = const Color(0xff4547EB),
    this.onPressed,
    this.text,
  });

  final Color? color;
  final String? text;
  final Color? textColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 169,
      height: 52,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: color!),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: textColor!),
          ),
        ),
      ),
    );
  }
}
