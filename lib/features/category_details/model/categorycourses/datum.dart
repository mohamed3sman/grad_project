import 'course_content.dart';

class Datum {
  String? category;
  List<CourseContent>? courseContent;
  String? description;
  dynamic discussion;
  num? id;
  num? instructorId;
  List<dynamic>? learning;
  String? level;
  String? name;
  dynamic notes;
  num? price;
  List<dynamic>? requirements;
  dynamic videoLink;

  Datum({
    this.category,
    this.courseContent,
    this.description,
    this.discussion,
    this.id,
    this.instructorId,
    this.learning,
    this.level,
    this.name,
    this.notes,
    this.price,
    this.requirements,
    this.videoLink,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        category: json['category'] as String?,
        courseContent: (json['course_content'] as List<dynamic>?)
            ?.map((e) => CourseContent.fromJson(e as Map<String, dynamic>))
            .toList(),
        description: json['description'] as String?,
        discussion: json['discussion'] as dynamic,
        id: json['id'] as num?,
        instructorId: json['instructor_id'] as num?,
        learning: json['learning'] as List<dynamic>?,
        level: json['level'] as String?,
        name: json['name'] as String?,
        notes: json['notes'] as dynamic,
        price: json['price'] as num?,
        requirements: json['requirements'] as List<dynamic>?,
        videoLink: json['video_link'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'category': category,
        'course_content': courseContent?.map((e) => e.toJson()).toList(),
        'description': description,
        'discussion': discussion,
        'id': id,
        'instructor_id': instructorId,
        'learning': learning,
        'level': level,
        'name': name,
        'notes': notes,
        'price': price,
        'requirements': requirements,
        'video_link': videoLink,
      };
}
