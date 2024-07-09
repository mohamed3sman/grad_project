import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:linkin/config/api_services.dart';
import 'package:linkin/config/router/app_pages.dart';
import 'package:linkin/config/utils/assets.dart';
import 'package:linkin/features/profile_user_corse/controller/profile_user_course_controller.dart';
import 'package:linkin/features/profile_user_corse/view/widget/help_with_widget.dart';
import 'package:linkin/features/profile_user_corse/view/widget/intereseted_in_widget.dart';

class ProfileUserCoursesView extends StatelessWidget {
  const ProfileUserCoursesView({super.key, this.image, this.name});
  final String? image;
  final String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.find<ProfileUserCourseController>().followed = false;
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<ProfileUserCourseController>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: ClipOval(
                child: Image.asset(
                  'assets/user5.png',
                  height: 70,
                  width: 70,
                ),
              )),
              const SizedBox(
                height: 4,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      controller.instData?.name ?? '',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      controller.instData?.category?.first ?? '',
                      style: const TextStyle(
                          color: Color(0xff696767),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${controller.instData?.followers.toString() ?? ''} Followers',
                      style: const TextStyle(
                          color: Color(0xff999999),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      color: const Color(0xfff8f8f8),
                      child: const Icon(
                        // ignore: deprecated_member_use
                        FontAwesomeIcons.commenting,
                        size: 24,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    GetBuilder<ProfileUserCourseController>(
                      builder: (controller) => Container(
                        width: 285,
                        height: 52,
                        color: const Color(0xff4547EB),
                        child: TextButton(
                          onPressed: () async {
                            controller.followingLoading = true;
                            controller.update();
                            await ApiService().skillSharingFollowing();
                            controller.followingLoading = false;
                            controller.update();
                          },
                          child: controller.followingLoading == true
                              ? Container(
                                  width: 25,
                                  height: 25,
                                  color: const Color(0xff4547EB),
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                  ))
                              : Text(
                                  Get.find<ProfileUserCourseController>()
                                              .followed ==
                                          false
                                      ? "Follow"
                                      : "Following",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "About",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 3),
                child: Text(
                  "Lorem ipsum dolor sit amet, consec adipiscing elit, dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet.",
                  style: TextStyle(
                      color: Color(0xff696767),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  maxLines: 3,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Interested In",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) => IntersertedinWidget(
                      text: controller.categories[index],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 17),
                child: Text(
                  "I Can Help With",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.schedulerSessions.length,
                  itemBuilder: (context, index) => HelpWithWidget(
                    text: controller.categories[index] ?? '',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Projects",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 240,
                        ),
                        Text(
                          "View All",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Image.asset(
                        AssetsData.projectcard,
                        width: 292,
                        height: 202,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Post",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              AssetsData.user1,
                              width: 32,
                              height: 32,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ahmad Elsayed",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Job Title",
                                  style: TextStyle(
                                      color: Color(0xff999999),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 150,
                            ),
                            const Icon(
                              Icons.add,
                              size: 10,
                              color: Color(0xff999999),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Follow",
                              style: TextStyle(
                                  color: Color(0xff999999),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "i am happy to share with you my latest achievementi've completed c++ course successfully",
                          style: TextStyle(
                              color: Color(0xff696767),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          height: 200,
                          width: 353,
                          color: const Color(0xffECEDFD),
                          child: Center(
                            child: Image.asset(
                              AssetsData.fancy1,
                              width: 258.71,
                              height: 200,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.thumbsUp,
                              size: 20,
                            ),
                            SizedBox(
                              width: 17,
                            ),
                            Icon(
                              // ignore: deprecated_member_use
                              FontAwesomeIcons.commenting,
                              size: 20,
                            ),
                            SizedBox(
                              width: 160,
                            ),
                            Text(
                              "2 comments",
                              style: TextStyle(
                                  color: Color(0xff999999),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              FontAwesomeIcons.solidThumbsUp,
                              size: 20,
                              color: Color(0xff999999),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "30",
                              style: TextStyle(
                                  color: Color(0xff999999),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 353,
                          height: 52,
                          decoration: BoxDecoration(
                            color: const Color(0xff4547EB),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.scheduleSession);
                              },
                              child: const Text(
                                "Schedule Session",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
