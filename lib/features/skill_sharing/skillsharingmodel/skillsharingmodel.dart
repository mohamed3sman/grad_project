import 'datum.dart';

class Skillsharingmodel {
  List<dynamic>? allCategories;
  List<Datum>? data;
  String? status;

  Skillsharingmodel({this.allCategories, this.data, this.status});

  factory Skillsharingmodel.fromJson(Map<String, dynamic> json) {
    return Skillsharingmodel(
      allCategories: json['all_categories'] as List<dynamic>?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'all_categories': allCategories,
        'data': data?.map((e) => e.toJson()).toList(),
        'status': status,
      };
}
