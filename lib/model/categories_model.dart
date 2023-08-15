import 'massage_model.dart';

class CategoriesModel {
  CategoriesModel({
    MassageModel? msg,
    List<Data>? data,
  }) {
    _msg = msg;
    _data = data;
  }

  CategoriesModel.fromJson(dynamic json) {
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
  CategoriesModel copyWith({
    MassageModel? msg,
    List<Data>? data,
  }) =>
      CategoriesModel(
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

/// icon : "/sites/default/files/2022-06/dfsdfsfdfsd.jpg"
/// image : "/sites/default/files/2022-08/1_7.jpg"
/// name : "أدوات منزلية"
/// tid : "19"

class Data {
  Data({
    String? icon,
    String? image,
    String? name,
    String? tid,
  }) {
    _icon = icon;
    _image = image;
    _name = name;
    _tid = tid;
  }

  Data.fromJson(dynamic json) {
    _icon = json['icon'];
    _image = json['image'];
    _name = json['name'];
    _tid = json['tid'];
  }
  String? _icon;
  String? _image;
  String? _name;
  String? _tid;
  Data copyWith({
    String? icon,
    String? image,
    String? name,
    String? tid,
  }) =>
      Data(
        icon: icon ?? _icon,
        image: image ?? _image,
        name: name ?? _name,
        tid: tid ?? _tid,
      );
  String? get icon => _icon;
  String? get image => _image;
  String? get name => _name;
  String? get tid => _tid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['icon'] = _icon;
    map['image'] = _image;
    map['name'] = _name;
    map['tid'] = _tid;
    return map;
  }
}

/// status : 1
/// message : "data"
