class Datum {
  num? followers;
  num? id;
  String? model;
  String? name;
  List<dynamic>? skills;

  Datum({this.followers, this.id, this.model, this.name, this.skills});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        followers: json['followers'] as num?,
        id: json['id'] as num?,
        model: json['model'] as String?,
        name: json['name'] as String?,
        skills: json['skills'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'followers': followers,
        'id': id,
        'model': model,
        'name': name,
        'skills': skills,
      };
}
