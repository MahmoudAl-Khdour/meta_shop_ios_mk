/// msg : {"status":1,"message":"products"}
/// data : [{"pid":"34","vid":"41","catagory_name":"مستلزمات طبية","title":"شطاف المسافر PORTABLE BIDET","fav":1,"body":"شطاف المسافر PORTABLE BIDET\r\n","price":"12","afterDiscount":"12.000","images":""}]

class FavoriteModel {
  FavoriteModel({
    Msg? msg,
    List<Data>? data,
  }) {
    _msg = msg;
    _data = data;
  }

  FavoriteModel.fromJson(dynamic json) {
    _msg = json['msg'] != null ? Msg.fromJson(json['msg']) : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  Msg? _msg;
  List<Data>? _data;
  FavoriteModel copyWith({
    Msg? msg,
    List<Data>? data,
  }) =>
      FavoriteModel(
        msg: msg ?? _msg,
        data: data ?? _data,
      );
  Msg? get msg => _msg;
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

/// pid : "34"
/// vid : "41"
/// catagory_name : "مستلزمات طبية"
/// title : "شطاف المسافر PORTABLE BIDET"
/// fav : 1
/// body : "شطاف المسافر PORTABLE BIDET\r\n"
/// price : "12"
/// afterDiscount : "12.000"
/// images : ""

class Data {
  Data({
    String? pid,
    String? vid,
    String? catagoryName,
    String? title,
    int? fav,
    String? body,
    String? price,
    String? afterDiscount,
    String? images,
  }) {
    _pid = pid;
    _vid = vid;
    _catagoryName = catagoryName;
    _title = title;
    _fav = fav;
    _body = body;
    _price = price;
    _afterDiscount = afterDiscount;
    _images = images;
  }

  Data.fromJson(dynamic json) {
    _pid = json['pid'];
    _vid = json['vid'];
    _catagoryName = json['catagory_name'];
    _title = json['title'];
    _fav = json['fav'];
    _body = json['body'];
    _price = json['price'];
    _afterDiscount = json['afterDiscount'];
    _images = json['images'];
  }
  String? _pid;
  String? _vid;
  String? _catagoryName;
  String? _title;
  int? _fav;
  String? _body;
  String? _price;
  String? _afterDiscount;
  String? _images;
  Data copyWith({
    String? pid,
    String? vid,
    String? catagoryName,
    String? title,
    int? fav,
    String? body,
    String? price,
    String? afterDiscount,
    String? images,
  }) =>
      Data(
        pid: pid ?? _pid,
        vid: vid ?? _vid,
        catagoryName: catagoryName ?? _catagoryName,
        title: title ?? _title,
        fav: fav ?? _fav,
        body: body ?? _body,
        price: price ?? _price,
        afterDiscount: afterDiscount ?? _afterDiscount,
        images: images ?? _images,
      );
  String? get pid => _pid;
  String? get vid => _vid;
  String? get catagoryName => _catagoryName;
  String? get title => _title;
  int? get fav => _fav;
  String? get body => _body;
  String? get price => _price;
  String? get afterDiscount => _afterDiscount;
  String? get images => _images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pid'] = _pid;
    map['vid'] = _vid;
    map['catagory_name'] = _catagoryName;
    map['title'] = _title;
    map['fav'] = _fav;
    map['body'] = _body;
    map['price'] = _price;
    map['afterDiscount'] = _afterDiscount;
    map['images'] = _images;
    return map;
  }
}

/// status : 1
/// message : "products"

class Msg {
  Msg({
    int? status,
    String? message,
  }) {
    _status = status;
    _message = message;
  }

  Msg.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  int? _status;
  String? _message;
  Msg copyWith({
    int? status,
    String? message,
  }) =>
      Msg(
        status: status ?? _status,
        message: message ?? _message,
      );
  int? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }
}
