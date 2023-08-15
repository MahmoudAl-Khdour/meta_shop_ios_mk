class MSGModel {
  MSGModel({
    Msg? msg,
  }) {
    _msg = msg;
  }

  MSGModel.fromJson(dynamic json) {
    _msg = json['msg'] != null ? Msg.fromJson(json['msg']) : null;
  }
  Msg? _msg;
  MSGModel copyWith({
    Msg? msg,
  }) =>
      MSGModel(
        msg: msg ?? _msg,
      );
  Msg? get msg => _msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_msg != null) {
      map['msg'] = _msg?.toJson();
    }
    return map;
  }
}

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
