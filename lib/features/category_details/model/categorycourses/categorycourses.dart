import 'datum.dart';

class Categorycourses {
  List<Datum>? data;
  String? status;

  Categorycourses({this.data, this.status});

  factory Categorycourses.fromJson(Map<String, dynamic> json) {
    return Categorycourses(
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
