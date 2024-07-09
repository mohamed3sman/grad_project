class Data {
  List<dynamic>? category;
  String? email;
  num? followers;
  List<dynamic>? followersObject;
  num? id;
  String? name;
  List<dynamic>? schedulerSessions;

  Data({
    this.category,
    this.email,
    this.followers,
    this.followersObject,
    this.id,
    this.name,
    this.schedulerSessions,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        category: json['category'] as List<dynamic>?,
        email: json['email'] as String?,
        followers: json['followers'] as num?,
        followersObject: json['followers_object'] as List<dynamic>?,
        id: json['id'] as num?,
        name: json['name'] as String?,
        schedulerSessions: json['scheduler_sessions'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'category': category,
        'email': email,
        'followers': followers,
        'followers_object': followersObject,
        'id': id,
        'name': name,
        'scheduler_sessions': schedulerSessions,
      };
}
