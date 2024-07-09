class Lessons {
  String? link;
  String? type;
  String? connent;

  Lessons({this.link, this.type, this.connent});

  Lessons.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    type = json['type'];
    connent = json['connent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['link'] = link;
    data['type'] = type;
    data['connent'] = connent;
    return data;
  }
}
