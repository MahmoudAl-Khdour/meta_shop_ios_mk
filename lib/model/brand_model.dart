class BrandModel {
  BrandModel({
    this.msg,
    this.data,
  });

  BrandModel.fromJson(dynamic json) {
    msg = json['msg'] != null ? Msg.fromJson(json['msg']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
  Msg? msg;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (msg != null) {
      map['msg'] = msg!.toJson();
    }
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.image,
    this.categoryId,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    categoryId = json['category_id'];
  }
  String? id;

  String? image;
  String? categoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['category_id'] = image;

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
