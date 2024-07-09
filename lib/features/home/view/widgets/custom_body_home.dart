import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkin/config/utils/public_controller.dart';
import 'package:linkin/features/home/controller/home_controller.dart';

class CustomBodyHome extends StatefulWidget {
  const CustomBodyHome({
    super.key,
  });

  @override
  State<CustomBodyHome> createState() => _CustomBodyHomeState();
}

class _CustomBodyHomeState extends State<CustomBodyHome> {
  @override
  void initState() {
    super.initState();
    Get.find<HomeController>().getUserName();
    Get.find<HomeController>().getUserEmail();
  }

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "hello 👋",
                style: TextStyle(
                    color: Color(0xff999999),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Ahmed',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(width: 200),
        Icon(
          Icons.search,
          size: 28,
        ),
        SizedBox(
          width: 20,
        ),
        Icon(
          Icons.shopping_cart_outlined,
          size: 28,
        ),
      ],
    );
  }
}
