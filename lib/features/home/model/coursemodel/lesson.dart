class Lesson {
  String? link;
  String? type;
  String? connent;

  Lesson({this.link, this.type, this.connent});

  Lesson.fromJson(Map<String, dynamic> json) {
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['link'] = link;

    return data;
  }
}
