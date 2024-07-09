import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkin/config/api_services.dart';
import 'package:linkin/config/router/app_pages.dart';
import 'package:linkin/features/skill_sharing/controller/sjill_sharing_controller.dart';
import 'package:linkin/features/skill_sharing/view/widgets/custom_builder_design.dart';

class CustomListViewBuilder extends StatefulWidget {
  const CustomListViewBuilder({super.key});

  @override
  State<CustomListViewBuilder> createState() => _CustomListViewBuilderState();
}

class _CustomListViewBuilderState extends State<CustomListViewBuilder> {
  // final List<SkillSharingModel> list = [
  //   SkillSharingModel(
  //     image: AssetsData.user1,
  //     name: "Ali Mohamed",
  //   ),
  //   SkillSharingModel(image: AssetsData.user2, name: "El Sayed Ahmed"),
  //   SkillSharingModel(image: AssetsData.user3, name: "Hassan Hassan"),
  //   SkillSharingModel(image: AssetsData.user4, name: "Mina Atef"),
  //   SkillSharingModel(image: AssetsData.user5, name: "Alaa Khaled"),
  //   SkillSharingModel(image: AssetsData.user6, name: "Salem Salem"),
  // ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SkillSharingController>(
      builder: (controller) => GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 1.7 / 2,
        ),
        itemCount: controller.users.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              controller.currentid = controller.users[index].id;
              controller.update();
              await ApiService().skillSharingProfile(controller.currentid);
              await ApiService().skillSharingFollowing();
              Get.toNamed(Routes.profileUserCourse);
            },
            child: CustomBiulderDesign(
                image: 'assets/user5.png',
                name: controller.users[index].name ?? '',
                specialization: controller.users[index].skills?.first ?? '',
                followersNumber: controller.users[index].followers.toString()),
          );
        },
      ),
    );
  }
}
