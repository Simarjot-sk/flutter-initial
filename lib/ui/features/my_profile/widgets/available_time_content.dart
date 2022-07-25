class AvailableTimeContent {
  List<Data>? data;

  AvailableTimeContent({this.data});

  AvailableTimeContent.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? day;
  String? fromTime;
  String? toTime;
  bool? status;

  Data({this.day, this.fromTime, this.toTime, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['from_time'] = this.fromTime;
    data['to_time'] = this.toTime;
    data['status'] = this.status;
    return data;
  }
}
