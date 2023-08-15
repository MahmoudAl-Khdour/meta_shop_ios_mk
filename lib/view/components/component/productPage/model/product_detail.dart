import 'package:meta_shop/model/massage_model.dart';

class ProductDetailModel {
  ProductDetailModel({
    MassageModel? msg,
    Data? data,
  }) {
    _msg = msg;
    _data = data;
  }

  ProductDetailModel.fromJson(dynamic json) {
    _msg = json['msg'] != null ? MassageModel.fromJson(json['msg']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  MassageModel? _msg;
  Data? _data;
  ProductDetailModel copyWith({
    MassageModel? msg,
    Data? data,
  }) =>
      ProductDetailModel(
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
    String? pid,
    String? vid,
    String? title,
    String? video,
    int? fav,
    String? catagory,
    String? body,
    String? price,
    String? afterDiscount,
    String? currencyCode,
    int? productReviewAvg,
    List<Images>? images,
    List<Related>? related,
    List<ProductReview>? productReview,
  }) {
    _pid = pid;
    _vid = vid;
    _title = title;
    _video = video;
    _fav = fav;
    _catagory = catagory;
    _body = body;
    _price = price;
    _afterDiscount = afterDiscount;
    _currencyCode = currencyCode;
    _images = images;
    _related = related;
    _productReviewAvg = productReviewAvg;
    _productReview = productReview;
  }

  Data.fromJson(dynamic json) {
    _pid = json['pid'];
    _vid = json['vid'];
    _video = json['video'];
    _title = json['title'];
    _fav = json['fav'];
    _catagory = json['catagory'];
    _body = json['body'];
    _price = json['price'];
    _afterDiscount = json['afterDiscount'];
    _currencyCode = json['currency_code'];
    _productReviewAvg = json['product_review_avg'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
    if (json['related'] != null) {
      _related = [];
      json['related'].forEach((v) {
        _related?.add(Related.fromJson(v));
      });
    }
    if (json['product_review'] != null) {
      _productReview = [];
      json['product_review'].forEach((v) {
        _productReview?.add(ProductReview.fromJson(v));
      });
    }
  }
  String? _pid;
  String? _vid;
  String? _title;
  String? _video;
  int? _fav;
  String? _catagory;
  String? _body;
  String? _price;
  String? _afterDiscount;
  String? _currencyCode;
  List<Images>? _images;
  List<Related>? _related;
  int? _productReviewAvg;
  List<ProductReview>? _productReview;

  Data copyWith({
    String? pid,
    String? vid,
    String? title,
    String? video,
    int? fav,
    String? catagory,
    String? body,
    String? price,
    String? afterDiscount,
    String? currencyCode,
    List<Images>? images,
    List<Related>? related,
    int? productReviewAvg,
    List<ProductReview>? productReview,
  }) =>
      Data(
        pid: pid ?? _pid,
        vid: vid ?? _vid,
        title: title ?? _title,
        video: video ?? _video,
        fav: fav ?? _fav,
        catagory: catagory ?? _catagory,
        body: body ?? _body,
        price: price ?? _price,
        afterDiscount: afterDiscount ?? _afterDiscount,
        currencyCode: currencyCode ?? _currencyCode,
        images: images ?? _images,
        related: related ?? _related,
        productReview: productReview ?? _productReview,
        productReviewAvg: productReviewAvg ?? _productReviewAvg,
      );
  String? get pid => _pid;
  String? get vid => _vid;
  String? get title => _title;
  String? get video => _video;
  int? get fav => _fav;
  String? get catagory => _catagory;
  String? get body => _body;
  String? get price => _price;
  String? get afterDiscount => _afterDiscount;
  String? get currencyCode => _currencyCode;
  int? get productReviewAvg => _productReviewAvg;
  List<Images>? get images => _images;
  List<Related>? get related => _related;
  List<ProductReview>? get productReview => _productReview;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pid'] = _pid;
    map['vid'] = _vid;
    map['title'] = _title;
    map['video'] = _video;
    map['fav'] = _fav;
    map['catagory'] = _catagory;
    map['body'] = _body;
    map['price'] = _price;
    map['product_review_avg'] = _productReviewAvg;
    map['afterDiscount'] = _afterDiscount;
    map['currency_code'] = _currencyCode;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    if (_related != null) {
      map['related'] = _related?.map((v) => v.toJson()).toList();
    }
    if (_productReview != null) {
      map['product_review'] = _productReview?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// pid : "33"
/// vid : "40"
/// title : "قواعد سيليكون للغسالة مانعة للانزلاق والاهتزازر"
/// price : "5"
/// afterDiscount : "5.000"
/// fav : 1
/// images : "/sites/default/files/2022-06/e56eadad405d01cf7fc128cf7c3f787e.png"

class Related {
  Related({
    String? pid,
    String? vid,
    String? title,
    String? price,
    String? afterDiscount,
    int? fav,
    String? images,
  }) {
    _pid = pid;
    _vid = vid;
    _title = title;
    _price = price;
    _afterDiscount = afterDiscount;
    _fav = fav;
    _images = images;
  }

  set fav(int? favi) {
    _fav = favi;
  }

  Related.fromJson(dynamic json) {
    _pid = json['pid'];
    _vid = json['vid'];
    _title = json['title'];
    _price = json['price'];
    _afterDiscount = json['afterDiscount'];
    _fav = json['fav'];
    _images = json['images'];
  }
  String? _pid;
  String? _vid;
  String? _title;
  String? _price;
  String? _afterDiscount;
  int? _fav;
  String? _images;
  Related copyWith({
    String? pid,
    String? vid,
    String? title,
    String? price,
    String? afterDiscount,
    int? fav,
    String? images,
  }) =>
      Related(
        pid: pid ?? _pid,
        vid: vid ?? _vid,
        title: title ?? _title,
        price: price ?? _price,
        afterDiscount: afterDiscount ?? _afterDiscount,
        fav: fav ?? _fav,
        images: images ?? _images,
      );
  String? get pid => _pid;
  String? get vid => _vid;
  String? get title => _title;
  String? get price => _price;
  String? get afterDiscount => _afterDiscount;
  int? get fav => _fav;
  String? get images => _images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pid'] = _pid;
    map['vid'] = _vid;
    map['title'] = _title;
    map['price'] = _price;
    map['afterDiscount'] = _afterDiscount;
    map['fav'] = _fav;
    map['images'] = _images;
    return map;
  }
}

/// url : "/sites/default/files/2022-06/74d7021fcc51bc8f852bd59f0442b84a.jpg"

class Images {
  Images({
    String? url,
  }) {
    _url = url;
  }

  Images.fromJson(dynamic json) {
    _url = json['url'];
  }
  String? _url;
  Images copyWith({
    String? url,
  }) =>
      Images(
        url: url ?? _url,
      );
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    return map;
  }
}

class ProductReview {
  ProductReview({
    String? name,
    String? body,
    int? rating,
  }) {
    _name = name;
    _body = body;
    _rating = rating;
  }

  ProductReview.fromJson(dynamic json) {
    _name = json['name'];
    _body = json['body'];
    _rating = json['rating'];
  }
  String? _name;
  String? _body;
  int? _rating;

  ProductReview copyWith({
    String? name,
    String? body,
    int? rating,
  }) =>
      ProductReview(
        name: name ?? _name,
        body: body ?? _body,
        rating: rating ?? _rating,
      );
  String? get name => _name;
  String? get body => _body;
  int? get rating => _rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['body'] = _body;
    map['rating'] = _rating;
    return map;
  }
}
