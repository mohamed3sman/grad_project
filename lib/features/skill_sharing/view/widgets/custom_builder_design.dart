import 'package:flutter/material.dart';

class CustomBiulderDesign extends StatelessWidget {
  const CustomBiulderDesign(
      {super.key,
      required this.image,
      required this.name,
      required this.specialization,
      required this.followersNumber});
  final String image;
  final String name;
  final String specialization;
  final String followersNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 168,
      height: 208,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(
              image,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            specialization,
            style: const TextStyle(
                color: Color(0xff696767),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "$followersNumber Followers",
            style: const TextStyle(
                color: Color(0xff696767),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
