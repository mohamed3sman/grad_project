import 'package:flutter/material.dart';
import 'package:linkin/config/utils/assets.dart';

class CustombodyComent extends StatelessWidget {
  const CustombodyComent({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AssetsData.vector,
          width: 14.05,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff696767)),
        ),
      ],
    );
  }
}
