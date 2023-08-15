import 'dart:convert';

/// msg : {"status":1}
/// data : [{"tid":131,"name":"الجنوب","delivery_price":"6.000000"},{"tid":135,"name":"الزرقاء","delivery_price":"5.000000"},{"tid":134,"name":"السلط","delivery_price":"3.000000"},{"tid":130,"name":"الشمال","delivery_price":"6.000000"},{"tid":132,"name":"المفرق","delivery_price":"2.000000"},{"tid":136,"name":"عمان","delivery_price":"1.000000"},{"tid":133,"name":"مادبا","delivery_price":"2.000000"}]

CountriesModel countriesModelFromJson(String str) =>
    CountriesModel.fromJson(json.decode(str));
String countriesModelToJson(CountriesModel data) => json.encode(data.toJson());

class CountriesModel {
  CountriesModel({
    Msg? msg,
    List<DataCountries>? data,
  }) {
    _msg = msg;
    _data = data;
  }

  CountriesModel.fromJson(dynamic json) {
    _msg = json['msg'] != null ? Msg.fromJson(json['msg']) : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(DataCountries.fromJson(v));
      });
    }
  }
  Msg? _msg;
  List<DataCountries>? _data;
  CountriesModel copyWith({
    Msg? msg,
    List<DataCountries>? data,
  }) =>
      CountriesModel(
        msg: msg ?? _msg,
        data: data ?? _data,
      );
  Msg? get msg => _msg;
  List<DataCountries>? get data => _data;

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

/// tid : 131
/// name : "الجنوب"
/// delivery_price : "6.000000"

DataCountries dataFromJson(String str) =>
    DataCountries.fromJson(json.decode(str));
String dataToJson(DataCountries data) => json.encode(data.toJson());

class DataCountries {
  DataCountries({
    int? tid,
    String? name,
    String? deliveryPrice,
  }) {
    _tid = tid;
    _name = name;
    _deliveryPrice = deliveryPrice;
  }

  DataCountries.fromJson(dynamic json) {
    _tid = json['tid'];
    _name = json['name'];
    _deliveryPrice = json['delivery_price'];
  }
  int? _tid;
  String? _name;
  String? _deliveryPrice;
  DataCountries copyWith({
    int? tid,
    String? name,
    String? deliveryPrice,
  }) =>
      DataCountries(
        tid: tid ?? _tid,
        name: name ?? _name,
        deliveryPrice: deliveryPrice ?? _deliveryPrice,
      );
  int? get tid => _tid;
  String? get name => _name;
  String? get deliveryPrice => _deliveryPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tid'] = _tid;
    map['name'] = _name;
    map['delivery_price'] = _deliveryPrice;
    return map;
  }
}

/// status : 1

Msg msgFromJson(String str) => Msg.fromJson(json.decode(str));
String msgToJson(Msg data) => json.encode(data.toJson());

class Msg {
  Msg({
    int? status,
  }) {
    _status = status;
  }

  Msg.fromJson(dynamic json) {
    _status = json['status'];
  }
  int? _status;
  Msg copyWith({
    int? status,
  }) =>
      Msg(
        status: status ?? _status,
      );
  int? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    return map;
  }
}
