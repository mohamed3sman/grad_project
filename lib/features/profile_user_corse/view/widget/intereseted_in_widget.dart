import 'package:flutter/material.dart';

class IntersertedinWidget extends StatelessWidget {
  const IntersertedinWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey)),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
