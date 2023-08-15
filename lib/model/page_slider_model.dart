class PageSliderModel {
  PageSliderModel({
    this.msg,
    this.data,
  });

  PageSliderModel.fromJson(dynamic json) {
    msg = json['msg'] != null ? Msg.fromJson(json['msg']) : null;
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }
  Msg? msg;
  List<String>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (msg != null) {
      map['msg'] = msg!.toJson();
    }
    map['data'] = data;
    return map;
  }
}

class Msg {
  Msg({
    this.status,
  });

  Msg.fromJson(dynamic json) {
    status = json['status'];
  }
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    return map;
  }
}
