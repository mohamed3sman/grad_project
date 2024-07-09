class Coursemodel {
  int? id;
  String? msg;
  String? status;

  Coursemodel({this.id, this.msg, this.status});

  factory Coursemodel.fromJson(Map<String, dynamic> json) {
    return Coursemodel(
      id: json['id'] as int?,
      msg: json['msg'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'msg': msg,
        'status': status,
      };
}
