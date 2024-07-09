import 'lesson.dart';

class CourseContent {
  List<Lessons>? lessons;

  CourseContent({this.lessons});

  CourseContent.fromJson(Map<String, dynamic> json) {
    if (json['lessons'] != null) {
      lessons = <Lessons>[];
      json['lessons'].forEach((v) {
        lessons!.add(Lessons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (lessons != null) {
      data['lessons'] = lessons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
