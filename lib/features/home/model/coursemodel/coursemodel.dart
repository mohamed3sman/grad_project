import 'datum.dart';

class Creatingcoursemodel {
  List<Datum>? data;
  String? status;

  Creatingcoursemodel({this.data, this.status});

  factory Creatingcoursemodel.fromJson(Map<String, dynamic> json) =>
      Creatingcoursemodel(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
        status: json['status'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'status': status,
      };
}
