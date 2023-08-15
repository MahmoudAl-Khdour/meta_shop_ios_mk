import '../../../../../model/massage_model.dart';

/// msg : {"status":1}
/// data : {"phone":"07999999","mail":"filmer@yahoo.com","fax":"0600000"}

class ContactInformationModel {
  ContactInformationModel({
    MassageModel? msg,
    Data? data,
  }) {
    _msg = msg;
    _data = data;
  }

  ContactInformationModel.fromJson(dynamic json) {
    _msg = json['msg'] != null ? MassageModel.fromJson(json['msg']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  MassageModel? _msg;
  Data? _data;
  ContactInformationModel copyWith({
    MassageModel? msg,
    Data? data,
  }) =>
      ContactInformationModel(
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

/// phone : "07999999"
/// mail : "filmer@yahoo.com"
/// fax : "0600000"

class Data {
  Data({
    String? phone,
    String? mail,
    String? fax,
  }) {
    _phone = phone;
    _mail = mail;
    _fax = fax;
  }

  Data.fromJson(dynamic json) {
    _phone = json['phone'];
    _mail = json['mail'];
    _fax = json['fax'];
  }
  String? _phone;
  String? _mail;
  String? _fax;
  Data copyWith({
    String? phone,
    String? mail,
    String? fax,
  }) =>
      Data(
        phone: phone ?? _phone,
        mail: mail ?? _mail,
        fax: fax ?? _fax,
      );
  String? get phone => _phone;
  String? get mail => _mail;
  String? get fax => _fax;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = _phone;
    map['mail'] = _mail;
    map['fax'] = _fax;
    return map;
  }
}

/// status : 1
