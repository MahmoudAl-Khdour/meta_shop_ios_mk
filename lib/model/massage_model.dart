/// msg : {"status":0,"message":"cart order not exist"}

class MassageModel {
  MassageModel({
    int? status,
    String? message,
  }) {
    _status = status;
    _message = message;
  }

  MassageModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  int? _status;
  String? _message;
  MassageModel copyWith({
    int? status,
    String? message,
  }) =>
      MassageModel(
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
