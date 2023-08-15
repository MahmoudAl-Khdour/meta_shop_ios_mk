/// status : true

class FlagModel {
  FlagModel({
    bool? status,
  }) {
    _status = status;
  }

  FlagModel.fromJson(dynamic json) {
    _status = json['status'];
  }
  bool? _status;
  FlagModel copyWith({
    bool? status,
  }) =>
      FlagModel(
        status: status ?? _status,
      );
  bool? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    return map;
  }
}
