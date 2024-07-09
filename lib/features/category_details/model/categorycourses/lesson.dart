class Lesson {
  String? link;

  Lesson({this.link});

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        link: json['link'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'link': link,
      };
}
