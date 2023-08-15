import '../../../../model/massage_model.dart';

/// msg : {"status":1,"message":"my address"}
/// data : [{"profile_id":"302","is_default":"0","FullAddress  ":{"given_name":"jjam","family_name":"dahoud","locality":"177","address_line1":"12","country_code":"JO"}},{"profile_id":"303","is_default":"1","FullAddress  ":{"given_name":"jjj","family_name":"11","locality":"amman","address_line1":"hh","country_code":"JO"}}]

class AddressModel {
  AddressModel({
    MassageModel? msg,
    List<Data>? data,
  }) {
    _msg = msg;
    _data = data;
  }

  AddressModel.fromJson(dynamic json) {
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
  AddressModel copyWith({
    MassageModel? msg,
    List<Data>? data,
  }) =>
      AddressModel(
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

/// profile_id : "302"
/// is_default : "0"
/// FullAddress   : {"given_name":"jjam","family_name":"dahoud","locality":"177","address_line1":"12","country_code":"JO"}

class Data {
  Data({
    String? profileId,
    String? isDefault,
    FullAddress? fullAddress,
  }) {
    _profileId = profileId;
    _isDefault = isDefault;
    _fullAddress = fullAddress;
  }

  set isDefault(String? isDefaultt) {
    _isDefault = isDefaultt;
  }

  Data.fromJson(dynamic json) {
    _profileId = json['profile_id'];
    _isDefault = json['is_default'];
    _fullAddress = json['FullAddress  '] != null
        ? FullAddress.fromJson(json['FullAddress  '])
        : null;
  }
  String? _profileId;
  String? _isDefault;
  FullAddress? _fullAddress;
  Data copyWith({
    String? profileId,
    String? isDefault,
    FullAddress? fullAddress,
  }) =>
      Data(
        profileId: profileId ?? _profileId,
        isDefault: isDefault ?? _isDefault,
        fullAddress: fullAddress ?? _fullAddress,
      );
  String? get profileId => _profileId;
  String? get isDefault => _isDefault;
  FullAddress? get fullAddress => _fullAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profile_id'] = _profileId;
    map['is_default'] = _isDefault;
    if (_fullAddress != null) {
      map['FullAddress  '] = _fullAddress?.toJson();
    }
    return map;
  }
}

/// given_name : "jjam"
/// family_name : "dahoud"
/// locality : "177"
/// address_line1 : "12"
/// country_code : "JO"

class FullAddress {
  FullAddress({
    String? givenName,
    String? familyName,
    String? locality,
    String? addressLine1,
    String? countryCode,
  }) {
    _givenName = givenName;
    _familyName = familyName;
    _locality = locality;
    _addressLine1 = addressLine1;
    _countryCode = countryCode;
  }

  FullAddress.fromJson(dynamic json) {
    _givenName = json['given_name'];
    _familyName = json['family_name'];
    _locality = json['locality'];
    _addressLine1 = json['address_line1'];
    _countryCode = json['country_code'];
  }
  String? _givenName;
  String? _familyName;
  String? _locality;
  String? _addressLine1;
  String? _countryCode;
  FullAddress copyWith({
    String? givenName,
    String? familyName,
    String? locality,
    String? addressLine1,
    String? countryCode,
  }) =>
      FullAddress(
        givenName: givenName ?? _givenName,
        familyName: familyName ?? _familyName,
        locality: locality ?? _locality,
        addressLine1: addressLine1 ?? _addressLine1,
        countryCode: countryCode ?? _countryCode,
      );
  String? get givenName => _givenName;
  String? get familyName => _familyName;
  String? get locality => _locality;
  String? get addressLine1 => _addressLine1;
  String? get countryCode => _countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['given_name'] = _givenName;
    map['family_name'] = _familyName;
    map['locality'] = _locality;
    map['address_line1'] = _addressLine1;
    map['country_code'] = _countryCode;
    return map;
  }
}

/// status : 1
/// message : "my address"
