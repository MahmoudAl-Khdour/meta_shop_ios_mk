import '../../../../../model/massage_model.dart';

/// msg : {"status":1,"message":"about us"}
/// data : {"title":"من نحن","body":"عن ميتاشوب\r\n\r\nمن نحن ؟\r\nفي وقت الانتشار الكبير للمتاجر الالكترونية كنا نحن الأفضل بالخدمة وتنوع المنتجات.. سنقدم لك العديد من المنتجات الكترونيًا التي ستناسب جميع الأذواق والأعمار وستسهل عليك حياتك.\r\n&nbsp;يتيح لك التسوق عن طريق الانترنت بأسعار منافسة وخدمة ما بعد البيع ، يحتوي على منتجات منوعة ومختلفة تناسب جميع الأشخاص، من أدوات منزلية، أدوات مطبخ، عدد صناعية، مستلزمات نسائية ورجالية، مسلتزمات أطفال، إضاءة والكترونيات، مستلزمات حديقة، وغيرها الكثير من المنتجات.\r\n"}

class AboutUsModel {
  AboutUsModel({
    MassageModel? msg,
    Data? data,
  }) {
    _msg = msg;
    _data = data;
  }

  AboutUsModel.fromJson(dynamic json) {
    _msg = json['msg'] != null ? MassageModel.fromJson(json['msg']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  MassageModel? _msg;
  Data? _data;
  AboutUsModel copyWith({
    MassageModel? msg,
    Data? data,
  }) =>
      AboutUsModel(
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

/// title : "من نحن"
/// body : "عن ميتاشوب\r\n\r\nمن نحن ؟\r\nفي وقت الانتشار الكبير للمتاجر الالكترونية كنا نحن الأفضل بالخدمة وتنوع المنتجات.. سنقدم لك العديد من المنتجات الكترونيًا التي ستناسب جميع الأذواق والأعمار وستسهل عليك حياتك.\r\n&nbsp;يتيح لك التسوق عن طريق الانترنت بأسعار منافسة وخدمة ما بعد البيع ، يحتوي على منتجات منوعة ومختلفة تناسب جميع الأشخاص، من أدوات منزلية، أدوات مطبخ، عدد صناعية، مستلزمات نسائية ورجالية، مسلتزمات أطفال، إضاءة والكترونيات، مستلزمات حديقة، وغيرها الكثير من المنتجات.\r\n"

class Data {
  Data({
    String? title,
    String? body,
  }) {
    _title = title;
    _body = body;
  }

  Data.fromJson(dynamic json) {
    _title = json['title'];
    _body = json['body'];
  }
  String? _title;
  String? _body;
  Data copyWith({
    String? title,
    String? body,
  }) =>
      Data(
        title: title ?? _title,
        body: body ?? _body,
      );
  String? get title => _title;
  String? get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['body'] = _body;
    return map;
  }
}

/// status : 1
/// message : "about us"
