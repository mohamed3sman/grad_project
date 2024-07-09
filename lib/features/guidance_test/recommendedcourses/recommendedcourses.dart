import 'datum.dart';

class Recommendedcourses {
  List<Datum>? data;
  String? status;

  Recommendedcourses({this.data, this.status});

  factory Recommendedcourses.fromJson(Map<String, dynamic> json) {
    return Recommendedcourses(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'status': status,
      };
}
