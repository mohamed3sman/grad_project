import 'lesson.dart';

class CourseContent {
  List<Lesson>? lessons;

  CourseContent({this.lessons});

  factory CourseContent.fromJson(Map<String, dynamic> json) => CourseContent(
        lessons: (json['lessons'] as List<dynamic>?)
            ?.map((e) => Lesson.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'lessons': lessons?.map((e) => e.toJson()).toList(),
      };
}
