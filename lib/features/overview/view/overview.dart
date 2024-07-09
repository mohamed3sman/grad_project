import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:linkin/features/cart/cart_seleckt/view/cart_view.dart';
import 'package:linkin/features/overview/controller/overview_controller.dart';
import 'package:linkin/features/overview/view/widgets/custom_body_coment.dart';
import 'package:linkin/config/utils/assets.dart';

class OverView extends StatelessWidget {
  const OverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GetBuilder<OverviewController>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.course?.name ?? '',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          color: const Color(0xffFFF2F0)),
                      child: Center(
                        child: Text(
                          controller.course?.level ?? '',
                          style: const TextStyle(
                              color: Color(0xffFE786C),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Row(
                children: [
                  Text('4.7',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff696767))),
                  SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: 87,
                    height: 21,
                    child: Row(
                      children: [
                        Icon(
                            FontAwesomeIcons
                                .solidStar, // استخدام أيقونة النجمة الممتلئة
                            size: 15,
                            color: Colors.amber),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                            FontAwesomeIcons
                                .solidStar, // استخدام أيقونة النجمة الممتلئة
                            size: 15,
                            color: Colors.amber),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                            FontAwesomeIcons
                                .solidStar, // استخدام أيقونة النجمة الممتلئة
                            size: 15,
                            color: Colors.amber),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                            FontAwesomeIcons
                                .solidStar, // استخدام أيقونة النجمة الممتلئة
                            size: 15,
                            color: Colors.amber),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                            FontAwesomeIcons
                                .solidStarHalf, // استخدام أيقونة النجمة الممتلئة
                            size: 15,
                            color: Colors.amber),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "(23,100)",
                    style: TextStyle(
                        fontSize: 10,
                        color: Color(0xff999999),
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Description",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                controller.course?.description ?? '',
                style: const TextStyle(
                  color: Color(0xff696767),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 4, // Set maxLines to 4
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Created By",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset(AssetsData.ellipse),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ehab Fayez",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Senior Ui Ux Designer",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff696767)),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Information",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    size: 16,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "12h 35m",
                    style: TextStyle(
                        color: Color(0xff696767),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Icon(
                    Icons.chrome_reader_mode_rounded,
                    size: 16,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "chapter",
                    style: TextStyle(
                        color: Color(0xff696767),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.people,
                    size: 16,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "45 students",
                    style: TextStyle(
                        color: Color(0xff696767),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: 135,
                  ),
                  Icon(
                    Icons.reviews_sharp,
                    size: 16,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "350 reviews",
                    style: TextStyle(
                        color: Color(0xff696767),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "What You Will Learn",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: controller.course?.learning?.length ?? 0,
                itemBuilder: (context, index) =>
                    CustombodyComent(text: controller.course?.learning?[index]),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Prerequisites",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: controller.course?.requirements?.length ?? 0,
                itemBuilder: (context, index) => CustombodyComent(
                    text: controller.course?.requirements?[index]),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Price",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${controller.course?.price.toString()} EGP',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: 353,
                  height: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xff4547EB),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const CartView();
                      }));
                    },
                    child: const Text(
                      "Add To Cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
