import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomRecommended extends StatelessWidget {
  const CustomBottomRecommended({
    super.key,
    required this.image,
    required this.courseName,
    required this.coursePrice,
    required this.courseDecription,
    this.onDelete,
    this.inProject = false,
    this.level,
  });
  final String image;
  final String courseName;
  final String courseDecription;
  final String coursePrice;
  final String? level;
  final bool? inProject;
  final Function()? onDelete;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400]!,
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  image,
                  width: inProject == false ? 210 : double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 200,
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        courseName,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      courseDecription,
                      style: const TextStyle(
                          color: Color(0xff9F9F9F),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
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
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$coursePrice EGP",
                          style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xff696767),
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(23),
                                color: const Color(0xffFFF2F0)),
                            child: Text(
                              textAlign: TextAlign.center,
                              level ?? '',
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xffFE786C),
                                  fontWeight: FontWeight.w500),
                            )),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
