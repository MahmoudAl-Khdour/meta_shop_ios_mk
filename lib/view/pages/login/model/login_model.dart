import '../../../../model/massage_model.dart';

class LoginModel {
  LoginModel({
    MassageModel? msg,
    Data? data,
  }) {
    _msg = msg;
    _data = data;
  }

  LoginModel.fromJson(dynamic json) {
    _msg = json['msg'] != null ? MassageModel.fromJson(json['msg']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  MassageModel? _msg;
  Data? _data;
  LoginModel copyWith({
    MassageModel? msg,
    Data? data,
  }) =>
      LoginModel(
        msg: msg ?? _msg,
        data: data ?? _data,
      );
  MassageModel? get msg => _msg;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_msg != null) {
      map['msg'] = _msg?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    String? id,
    String? role,
    String? userName,
    // String? social,
    String? userPicture,
    String? email,
  }) {
    _id = id;
    _role = role;
    _userName = userName;
    // _social = social;
    _userPicture = userPicture;
    _email = email;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _role = json['role'];
    _userName = json['user_name'];
    // _social = json['social'];
    _userPicture = json['user_picture'];
    _email = json['email'];
  }
  String? _id;
  String? _role;
  String? _userName;
  // String? _social;
  String? _userPicture;
  String? _email;
  Data copyWith({
    String? id,
    String? role,
    String? userName,
    String? social,
    String? userPicture,
    String? email,
  }) =>
      Data(
        id: id ?? _id,
        role: role ?? _role,
        userName: userName ?? _userName,
        // social: social ?? _social,
        userPicture: userPicture ?? _userPicture,
        email: email ?? _email,
      );
  String? get id => _id;
  String? get role => _role;
  String? get userName => _userName;
  // String? get social => _social;
  String? get userPicture => _userPicture;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['role'] = _role;
    map['user_name'] = _userName;
    // map['social'] = _social;
    map['user_picture'] = _userPicture;
    map['email'] = _email;
    return map;
  }
}

/// status : 0
/// message : "user already exists"
