import 'data.dart';

class ProfileUserCourse {
  Data? data;
  String? status;
  num? statusCode;

  ProfileUserCourse({this.data, this.status, this.statusCode});

  factory ProfileUserCourse.fromJson(Map<String, dynamic> json) {
    return ProfileUserCourse(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String?,
      statusCode: json['status_code'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'status': status,
        'status_code': statusCode,
      };
}
