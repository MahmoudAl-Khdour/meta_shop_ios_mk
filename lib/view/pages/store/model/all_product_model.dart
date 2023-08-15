import 'dart:convert';

import 'package:meta_shop/model/massage_model.dart';

class AllProductModel {
  AllProductModel({
    MassageModel? msg,
    List<DataAllProduct>? data,
  }) {
    _msg = msg;
    _data = data;
  }

  AllProductModel.fromJson(dynamic json) {
    _msg = json['msg'] != null ? MassageModel.fromJson(json['msg']) : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(DataAllProduct.fromJson(v));
      });
    }
  }
  MassageModel? _msg;
  List<DataAllProduct>? _data;
  AllProductModel copyWith({
    MassageModel? msg,
    List<DataAllProduct>? data,
  }) =>
      AllProductModel(
        msg: msg ?? _msg,
        data: data ?? _data,
      );
  MassageModel? get msg => _msg;
  List<DataAllProduct>? get data => _data;

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

List<DataAllProduct> dataModelFromJson(String str) => List<DataAllProduct>.from(
    json.decode(str).map((x) => DataAllProduct.fromJson(x)));

class DataAllProduct {
  DataAllProduct({
    String? pid,
    String? vid,
    String? title,
    int? fav,
    String? body,
    String? price,
    String? afterDiscount,
    String? images,
    int? count = 1,
  }) {
    _pid = pid;
    _vid = vid;
    _title = title;
    _fav = fav;
    _body = body;
    _price = price;
    _afterDiscount = afterDiscount;
    _images = images;
    _count = count;
  }

  set fav(int? favi) {
    _fav = favi;
  }

  set counti(int? counti) {
    _count = counti!;
  }

  DataAllProduct.fromJson(dynamic json) {
    _pid = json['pid'];
    _vid = json['vid'];
    _title = json['title'];
    _fav = json['fav'];
    _body = json['body'];
    _price = json['price'];
    _afterDiscount = json['afterDiscount'];
    _images = json['images'];
  }
  String? _pid;
  String? _vid;
  String? _title;
  int? _fav;
  String? _body;
  String? _price;
  String? _afterDiscount;
  String? _images;
  int? _count = 1;

  DataAllProduct copyWith({
    String? pid,
    String? vid,
    String? title,
    int? fav,
    String? body,
    String? price,
    String? afterDiscount,
    String? images,
    int? count,
  }) =>
      DataAllProduct(
        pid: pid ?? _pid,
        vid: vid ?? _vid,
        title: title ?? _title,
        fav: fav ?? _fav,
        body: body ?? _body,
        price: price ?? _price,
        afterDiscount: afterDiscount ?? _afterDiscount,
        images: images ?? _images,
        count: count ?? _count,
      );
  String? get pid => _pid;
  String? get vid => _vid;
  String? get title => _title;
  int? get fav => _fav;
  String? get body => _body;
  String? get price => _price;
  String? get afterDiscount => _afterDiscount;
  String? get images => _images;
  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pid'] = _pid;
    map['vid'] = _vid;
    map['title'] = _title;
    map['fav'] = _fav;
    map['body'] = _body;
    map['price'] = _price;
    map['afterDiscount'] = _afterDiscount;
    map['images'] = _images;
    return map;
  }
}
