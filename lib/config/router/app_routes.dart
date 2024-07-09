import 'package:get/get.dart';
import 'package:linkin/config/router/app_pages.dart';
import 'package:linkin/features/add_course/bindings/add_course_bindings.dart';
import 'package:linkin/features/add_course/view/add_course_view.dart';
import 'package:linkin/features/add_course_contant/view/add_course_contant.dart';
import 'package:linkin/features/caht/view/chat_view.dart';
import 'package:linkin/features/category_details/bindings/category_details_bindings.dart';
import 'package:linkin/features/category_details/view/category_details_view.dart';
import 'package:linkin/features/chat/bindings/chat_view_bindings.dart';
import 'package:linkin/features/course_details/bindings/course_details_bindings.dart';
import 'package:linkin/features/course_details/view/course_details_view.dart';
import 'package:linkin/features/course_lessons/bindings/course_lessons_bindings.dart';
import 'package:linkin/features/course_lessons/view/course_lessons_view.dart';
import 'package:linkin/features/course_sections/bindings/course_sections_bindings.dart';
import 'package:linkin/features/course_sections/view/course_sections_view.dart';
import 'package:linkin/features/guidance_test/bindings/guidance_bindings.dart';
import 'package:linkin/features/guidance_test/view/guidance_test.dart';
import 'package:linkin/features/home/bindings/home_bindings.dart';
import 'package:linkin/features/home/view/home_view.dart';
import 'package:linkin/features/instructor/bindings/instructor_bindings.dart';
import 'package:linkin/features/instructor/view/instructor_view.dart';
import 'package:linkin/features/overview/bindings/overview_bindings.dart';
import 'package:linkin/features/overview/view/overview.dart';
import 'package:linkin/features/profile_user_corse/bindings/profile_user_course_bindings.dart';
import 'package:linkin/features/profile_user_corse/view/profile_user_courses_view.dart';
import 'package:linkin/features/reward_view/bindings/reward_view_bindings.dart';
import 'package:linkin/features/reward_view/view/reward_view.dart';
import 'package:linkin/features/schedule_session/bindings/schedule_session_bindings.dart';
import 'package:linkin/features/schedule_session/view/schedule_session_view.dart';
import 'package:linkin/features/settings/view/settings_view.dart';
import 'package:linkin/features/sign_in/bindings/login_bindings.dart';
import 'package:linkin/features/sign_in/view/sign_in.dart';
import 'package:linkin/features/sign_up/bindings/register_bindings.dart';
import 'package:linkin/features/sign_up/view/sign_up.dart';
import 'package:linkin/features/skill_sharing/bindings/sjill_sharing_bindings.dart';
import 'package:linkin/features/skill_sharing/view/skill_sharing_view.dart';
import 'package:linkin/features/splash/splash_view.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: Routes.initial,
        page: () => const SplashView(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(milliseconds: 1500)),
    GetPage(
      name: Routes.signUp,
      page: () => const SignUp(),
      binding: RegisterBindings(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 1500),
    ),
    GetPage(
      name: Routes.logIn,
      page: () => const SignIn(),
      binding: LoginBindings(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 1500),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBindings(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 1500),
    ),
    GetPage(
      name: Routes.settings,
      page: () => const SettingsView(),
      binding: HomeBindings(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 1500),
    ),
    GetPage(
      name: Routes.addCourse,
      page: () => const AddCourseView(),
      binding: AddCourseBindings(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 1500),
    ),
    GetPage(
      name: Routes.courseDetails,
      page: () => const CourseDetailsView(),
      binding: CourseDetailsBindings(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 1500),
    ),
    GetPage(
      name: Routes.chat,
      page: () => const ChatView(),
      binding: ChatBindings(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 1500),
    ),
    GetPage(
      name: Routes.addcoursecontent,
      page: () => const AddCourseContentView(),
      binding: AddCourseBindings(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 1500),
    ),
    GetPage(
      name: Routes.reward,
      page: () => const RewardView(),
      binding: RewardBindings(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 1500),
    ),
    GetPage(
      name: Routes.instructor,
      page: () => const InstructorView(),
      binding: InstructorBindings(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 1500),
    ),
    GetPage(
      name: Routes.courseSections,
      page: () => const CourseSectionsView(),
      binding: CourseSectionsBindings(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 1500),
    ),
    GetPage(
      name: Routes.courseLessons,
      page: () => const CourseLessonsView(),
      binding: CourseLessonsBindings(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 1500),
    ),
    GetPage(
      name: Routes.overView,
      page: () => const OverView(),
      binding: OverviewBindings(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 1500),
    ),
    GetPage(
      name: Routes.categoryDetails,
      page: () => const CategoryDatilsView(),
      binding: CategoryDatilsBindings(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 1500),
    ),
    GetPage(
      name: Routes.skillSharing,
      page: () => const SkillSharingView(),
      binding: SkillSharingBindings(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 1500),
    ),
    GetPage(
      name: Routes.profileUserCourse,
      page: () => const ProfileUserCoursesView(),
      binding: ProfileUserCourseBindings(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 1500),
    ),
    GetPage(
      name: Routes.scheduleSession,
      page: () => const ScheduleSessionView(),
      binding: ScheduleSessionBindings(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 1500),
    ),
    GetPage(
      name: Routes.guidance,
      page: () => const GuidanceTest(),
      binding: GuidanceBindings(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 1500),
    ),
  ];
}
