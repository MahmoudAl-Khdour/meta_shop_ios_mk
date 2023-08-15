import '../../../../model/massage_model.dart';

/// msg : {"status":1,"message":"Successful"}
/// data : {"id":"98","role":"customer","userName":"mahmoud","phone":"07895846351","profile":[{"givenName":"mahmoud","familyName":"khdour","locality":"177","addressLine":"12","countryCode":"JO"},{"givenName":"jjj","familyName":"11","locality":"amman","addressLine1":"hh","countryCode":"JO"}],"email":"user1658840723439@fimar.com","user_picture":""}

class ProfileModel {
  ProfileModel({
    MassageModel? msg,
    Data? data,
  }) {
    _msg = msg;
    _data = data;
  }

  ProfileModel.fromJson(dynamic json) {
    _msg = json['msg'] != null ? MassageModel.fromJson(json['msg']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  MassageModel? _msg;
  Data? _data;
  ProfileModel copyWith({
    MassageModel? msg,
    Data? data,
  }) =>
      ProfileModel(
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

/// id : "98"
/// role : "customer"
/// userName : "mahmoud"
/// phone : "07895846351"
/// profile : [{"givenName":"mahmoud","familyName":"khdour","locality":"177","addressLine":"12","countryCode":"JO"},{"givenName":"jjj","familyName":"11","locality":"amman","addressLine1":"hh","countryCode":"JO"}]
/// email : "user1658840723439@fimar.com"
/// user_picture : ""

class Data {
  Data({
    String? id,
    String? role,
    String? userName,
    String? phone,
    List<Profile>? profile,
    String? email,
    String? userPicture,
  }) {
    _id = id;
    _role = role;
    _userName = userName;
    _phone = phone;
    _profile = profile;
    _email = email;
    _userPicture = userPicture;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _role = json['role'];
    _userName = json['userName'];
    _phone = json['phone'];
    if (json['profile'] != null) {
      _profile = [];
      json['profile'].forEach((v) {
        _profile?.add(Profile.fromJson(v));
      });
    }
    _email = json['email'];
    _userPicture = json['user_picture'];
  }
  String? _id;
  String? _role;
  String? _userName;
  String? _phone;
  List<Profile>? _profile;
  String? _email;
  String? _userPicture;
  Data copyWith({
    String? id,
    String? role,
    String? userName,
    String? phone,
    List<Profile>? profile,
    String? email,
    String? userPicture,
  }) =>
      Data(
        id: id ?? _id,
        role: role ?? _role,
        userName: userName ?? _userName,
        phone: phone ?? _phone,
        profile: profile ?? _profile,
        email: email ?? _email,
        userPicture: userPicture ?? _userPicture,
      );
  String? get id => _id;
  String? get role => _role;
  String? get userName => _userName;
  String? get phone => _phone;
  List<Profile>? get profile => _profile;
  String? get email => _email;
  String? get userPicture => _userPicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['role'] = _role;
    map['userName'] = _userName;
    map['phone'] = _phone;
    if (_profile != null) {
      map['profile'] = _profile?.map((v) => v.toJson()).toList();
    }
    map['email'] = _email;
    map['user_picture'] = _userPicture;
    return map;
  }
}

/// givenName : "mahmoud"
/// familyName : "khdour"
/// locality : "177"
/// addressLine : "12"
/// countryCode : "JO"

class Profile {
  Profile({
    String? givenName,
    String? familyName,
    String? locality,
    String? addressLine,
    String? countryCode,
  }) {
    _givenName = givenName;
    _familyName = familyName;
    _locality = locality;
    _addressLine = addressLine;
    _countryCode = countryCode;
  }

  Profile.fromJson(dynamic json) {
    _givenName = json['givenName'];
    _familyName = json['familyName'];
    _locality = json['locality'];
    _addressLine = json['addressLine'];
    _countryCode = json['countryCode'];
  }
  String? _givenName;
  String? _familyName;
  String? _locality;
  String? _addressLine;
  String? _countryCode;
  Profile copyWith({
    String? givenName,
    String? familyName,
    String? locality,
    String? addressLine,
    String? countryCode,
  }) =>
      Profile(
        givenName: givenName ?? _givenName,
        familyName: familyName ?? _familyName,
        locality: locality ?? _locality,
        addressLine: addressLine ?? _addressLine,
        countryCode: countryCode ?? _countryCode,
      );
  String? get givenName => _givenName;
  String? get familyName => _familyName;
  String? get locality => _locality;
  String? get addressLine => _addressLine;
  String? get countryCode => _countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['givenName'] = _givenName;
    map['familyName'] = _familyName;
    map['locality'] = _locality;
    map['addressLine'] = _addressLine;
    map['countryCode'] = _countryCode;
    return map;
  }
}

/// status : 1
/// message : "Successful"
