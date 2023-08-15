import 'package:meta_shop/model/massage_model.dart';

class CurrentCartModel {
  CurrentCartModel({
    MassageModel? msg,
    Data? data,
  }) {
    _msg = msg;
    _data = data;
  }

  CurrentCartModel.fromJson(dynamic json) {
    _msg = json['msg'] != null ? MassageModel.fromJson(json['msg']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  MassageModel? _msg;
  Data? _data;
  CurrentCartModel copyWith({
    MassageModel? msg,
    Data? data,
  }) =>
      CurrentCartModel(
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
    String? orderId,
    String? state,
    List<Fees>? fees,
    String? totalOrderPrice,
    String? totalOrderPriceAfter,
    List<Items>? items,
    List<Coupons>? coupons,
  }) {
    _orderId = orderId;
    _state = state;
    _fees = fees;
    _totalOrderPrice = totalOrderPrice;
    _totalOrderPriceAfter = totalOrderPriceAfter;
    _items = items;
  }

  Data.fromJson(dynamic json) {
    _orderId = json['order_id'];
    _state = json['state'];
    if (json['fees'] != null) {
      _fees = [];
      json['fees'].forEach((v) {
        _fees?.add(Fees.fromJson(v));
      });
    }
    _totalOrderPrice = json['total_order_price'];
    _totalOrderPriceAfter = json['total_order_price_after'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
    if (json['coupons'] != null) {
      _coupons = [];
      json['coupons'].forEach((v) {
        _coupons?.add(Coupons.fromJson(v));
      });
    }
  }
  String? _orderId;
  String? _state;
  List<Fees>? _fees;
  String? _totalOrderPrice;
  String? _totalOrderPriceAfter;
  List<Items>? _items;
  List<Coupons>? _coupons;

  Data copyWith({
    String? orderId,
    String? state,
    List<Fees>? fees,
    String? totalOrderPrice,
    String? totalOrderPriceAfter,
    List<Items>? items,
    List<Coupons>? coupons,
  }) =>
      Data(
        orderId: orderId ?? _orderId,
        state: state ?? _state,
        fees: fees ?? _fees,
        totalOrderPrice: totalOrderPrice ?? _totalOrderPrice,
        totalOrderPriceAfter: totalOrderPriceAfter ?? _totalOrderPriceAfter,
        items: items ?? _items,
        coupons: coupons ?? _coupons,
      );
  String? get orderId => _orderId;
  String? get state => _state;
  List<Fees>? get fees => _fees;
  String? get totalOrderPrice => _totalOrderPrice;
  String? get totalOrderPriceAfter => _totalOrderPriceAfter;
  List<Items>? get items => _items;
  List<Coupons>? get coupons => _coupons;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = _orderId;
    map['state'] = _state;
    if (_fees != null) {
      map['fees'] = _fees?.map((v) => v.toJson()).toList();
    }
    map['total_order_price'] = _totalOrderPrice;
    map['total_order_price_after'] = _totalOrderPriceAfter;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    if (_coupons != null) {
      map['coupons'] = _coupons?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Items {
  Items({
    String? orderId,
    String? orderItemId,
    String? title,
    int? quantity,
    String? unitPrice,
    String? totalUnitPrice,
    String? image,
  }) {
    _orderId = orderId;
    _orderItemId = orderItemId;
    _title = title;
    _quantity = quantity;
    _unitPrice = unitPrice;
    _totalUnitPrice = totalUnitPrice;
    _image = image;
  }

  Items.fromJson(dynamic json) {
    _orderId = json['order_id'];
    _orderItemId = json['order_item_id'];
    _title = json['title'];
    _quantity = json['quantity'];
    _unitPrice = json['unit_price'];
    _totalUnitPrice = json['total_unit_price'];
    _image = json['image'];
  }
  String? _orderId;
  String? _orderItemId;
  String? _title;
  int? _quantity;
  String? _unitPrice;
  String? _totalUnitPrice;
  String? _image;
  Items copyWith({
    String? orderId,
    String? orderItemId,
    String? title,
    int? quantity,
    String? unitPrice,
    String? totalUnitPrice,
    String? image,
  }) =>
      Items(
        orderId: orderId ?? _orderId,
        orderItemId: orderItemId ?? _orderItemId,
        title: title ?? _title,
        quantity: quantity ?? _quantity,
        unitPrice: unitPrice ?? _unitPrice,
        totalUnitPrice: totalUnitPrice ?? _totalUnitPrice,
        image: image ?? _image,
      );
  String? get orderId => _orderId;
  String? get orderItemId => _orderItemId;
  String? get title => _title;
  int? get quantity => _quantity;
  String? get unitPrice => _unitPrice;
  String? get totalUnitPrice => _totalUnitPrice;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = _orderId;
    map['order_item_id'] = _orderItemId;
    map['title'] = _title;
    map['quantity'] = _quantity;
    map['unit_price'] = _unitPrice;
    map['total_unit_price'] = _totalUnitPrice;
    map['image'] = _image;
    return map;
  }
}

/// amount : "3"
/// label : "رسوم التوصيل"

class Fees {
  Fees({
    String? amount,
    String? label,
  }) {
    _amount = amount;
    _label = label;
  }

  Fees.fromJson(dynamic json) {
    _amount = json['amount'];
    _label = json['label'];
  }
  String? _amount;
  String? _label;
  Fees copyWith({
    String? amount,
    String? label,
  }) =>
      Fees(
        amount: amount ?? _amount,
        label: label ?? _label,
      );
  String? get amount => _amount;
  String? get label => _label;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = _amount;
    map['label'] = _label;
    return map;
  }
}

class Coupons {
  Coupons({
    String? couponId,
    String? code,
  }) {
    _couponId = couponId;
    _code = code;
  }

  Coupons.fromJson(dynamic json) {
    _couponId = json['coupon_id'];
    _code = json['code'];
  }
  String? _couponId;
  String? _code;
  Coupons copyWith({
    String? couponId,
    String? code,
  }) =>
      Coupons(
        couponId: couponId ?? _couponId,
        code: code ?? _code,
      );
  String? get couponId => _couponId;
  String? get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['coupon_id'] = _couponId;
    map['code'] = _code;
    return map;
  }
}
