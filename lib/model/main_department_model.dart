import 'package:meta_shop/model/massage_model.dart';

/// msg : {"status":1,"message":"main department"}
/// data : [{"id":"19","name":"أدوات منزلية"},{"id":"21","name":"عطور"},{"id":"11","name":"عدد صناعية"},{"id":"20","name":"أدوات المطبخ"},{"id":"30","name":"أجهزة رياضية الكترونية"},{"id":"18","name":"مستلزمات رجالية"},{"id":"13","name":"الكترونيات"},{"id":"14","name":"مستلزمات نسائية"},{"id":"10","name":"مستلزمات أطفال"},{"id":"8","name":"مستلزمات السيارة"},{"id":"2","name":"مستلزمات حديقة وشواء"},{"id":"7","name":"مستلزمات رياضية"},{"id":"12","name":"مستلزمات طبية"}]

class MainDepartmentModel {
  MainDepartmentModel({
    MassageModel? msg,
    List<Data>? data,
  }) {
    _msg = msg;
    _data = data;
  }

  MainDepartmentModel.fromJson(dynamic json) {
    _msg = json['msg'] != null ? MassageModel.fromJson(json['msg']) : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  MassageModel? _msg;
  List<Data>? _data;
  MainDepartmentModel copyWith({
    MassageModel? msg,
    List<Data>? data,
  }) =>
      MainDepartmentModel(
        msg: msg ?? _msg,
        data: data ?? _data,
      );
  MassageModel? get msg => _msg;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_msg != null) {
      map['msg'] = _msg?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "19"
/// name : "أدوات منزلية"

class Data {
  Data({
    String? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  String? _id;
  String? _name;
  Data copyWith({
    String? id,
    String? name,
  }) =>
      Data(
        id: id ?? _id,
        name: name ?? _name,
      );
  String? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }
}
