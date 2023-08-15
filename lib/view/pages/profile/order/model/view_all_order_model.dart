import 'package:meta_shop/model/massage_model.dart';

class ViewAllOrderModel {
  ViewAllOrderModel({
    MassageModel? msg,
    List<Data>? data,
  }) {
    _msg = msg;
    _data = data;
  }

  ViewAllOrderModel.fromJson(dynamic json) {
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
  ViewAllOrderModel copyWith({
    MassageModel? msg,
    List<Data>? data,
  }) =>
      ViewAllOrderModel(
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

class Data {
  Data({
    String? orderId,
    String? state,
    String? date,
    List<Fees>? fees,
    String? totalOrderPrice,
    String? totalOrderPriceAfter,
    List<Items>? items,
    BillingInformation? billingInformation,
  }) {
    _orderId = orderId;
    _state = state;
    _date = date;
    _fees = fees;
    _totalOrderPrice = totalOrderPrice;
    _totalOrderPriceAfter = totalOrderPriceAfter;
    _items = items;
    _billingInformation = billingInformation;
  }

  Data.fromJson(dynamic json) {
    _orderId = json['order_id'];
    _state = json['state'];
    _date = json['date'];
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
    _billingInformation = json['billing_information'] != null
        ? BillingInformation.fromJson(json['billing_information'])
        : null;
  }
  String? _orderId;
  String? _state;
  String? _date;
  List<Fees>? _fees;
  String? _totalOrderPrice;
  String? _totalOrderPriceAfter;
  List<Items>? _items;
  BillingInformation? _billingInformation;
  Data copyWith({
    String? orderId,
    String? state,
    String? date,
    List<Fees>? fees,
    String? totalOrderPrice,
    String? totalOrderPriceAfter,
    List<Items>? items,
    BillingInformation? billingInformation,
  }) =>
      Data(
        orderId: orderId ?? _orderId,
        state: state ?? _state,
        date: date ?? _date,
        fees: fees ?? _fees,
        totalOrderPrice: totalOrderPrice ?? _totalOrderPrice,
        totalOrderPriceAfter: totalOrderPriceAfter ?? _totalOrderPriceAfter,
        items: items ?? _items,
        billingInformation: billingInformation ?? _billingInformation,
      );
  String? get orderId => _orderId;
  String? get state => _state;
  String? get date => _date;
  List<Fees>? get fees => _fees;
  String? get totalOrderPrice => _totalOrderPrice;
  String? get totalOrderPriceAfter => _totalOrderPriceAfter;
  List<Items>? get items => _items;
  BillingInformation? get billingInformation => _billingInformation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = _orderId;
    map['state'] = _state;
    map['date'] = _date;
    if (_fees != null) {
      map['fees'] = _fees?.map((v) => v.toJson()).toList();
    }
    map['total_order_price'] = _totalOrderPrice;
    map['total_order_price_after'] = _totalOrderPriceAfter;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    if (_billingInformation != null) {
      map['billing_information'] = _billingInformation?.toJson();
    }
    return map;
  }
}

class BillingInformation {
  BillingInformation({
    String? profileId,
    String? isDefault,
    String? givenName,
    String? familyName,
    String? locality,
    String? addressLine1,
    String? countryCode,
  }) {
    _profileId = profileId;
    _isDefault = isDefault;
    _givenName = givenName;
    _familyName = familyName;
    _locality = locality;
    _addressLine1 = addressLine1;
    _countryCode = countryCode;
  }

  BillingInformation.fromJson(dynamic json) {
    _profileId = json['profile_id'];
    _isDefault = json['is_default'];
    _givenName = json['given_name'];
    _familyName = json['family_name'];
    _locality = json['locality'];
    _addressLine1 = json['address_line1'];
    _countryCode = json['country_code'];
  }
  String? _profileId;
  String? _isDefault;
  String? _givenName;
  String? _familyName;
  String? _locality;
  String? _addressLine1;
  String? _countryCode;
  BillingInformation copyWith({
    String? profileId,
    String? isDefault,
    String? givenName,
    String? familyName,
    String? locality,
    String? addressLine1,
    String? countryCode,
  }) =>
      BillingInformation(
        profileId: profileId ?? _profileId,
        isDefault: isDefault ?? _isDefault,
        givenName: givenName ?? _givenName,
        familyName: familyName ?? _familyName,
        locality: locality ?? _locality,
        addressLine1: addressLine1 ?? _addressLine1,
        countryCode: countryCode ?? _countryCode,
      );
  String? get profileId => _profileId;
  String? get isDefault => _isDefault;
  String? get givenName => _givenName;
  String? get familyName => _familyName;
  String? get locality => _locality;
  String? get addressLine1 => _addressLine1;
  String? get countryCode => _countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profile_id'] = _profileId;
    map['is_default'] = _isDefault;
    map['given_name'] = _givenName;
    map['family_name'] = _familyName;
    map['locality'] = _locality;
    map['address_line1'] = _addressLine1;
    map['country_code'] = _countryCode;
    return map;
  }
}

class Items {
  Items({
    String? orderItemId,
    String? title,
    int? quantity,
    String? unitPrice,
    String? totalUnitPrice,
    String? image,
  }) {
    _orderItemId = orderItemId;
    _title = title;
    _quantity = quantity;
    _unitPrice = unitPrice;
    _totalUnitPrice = totalUnitPrice;
    _image = image;
  }

  Items.fromJson(dynamic json) {
    _orderItemId = json['order_item_id'];
    _title = json['title'];
    _quantity = json['quantity'];
    _unitPrice = json['unit_price'];
    _totalUnitPrice = json['total_unit_price'];
    _image = json['image'];
  }
  String? _orderItemId;
  String? _title;
  int? _quantity;
  String? _unitPrice;
  String? _totalUnitPrice;
  String? _image;
  Items copyWith({
    String? orderItemId,
    String? title,
    int? quantity,
    String? unitPrice,
    String? totalUnitPrice,
    String? image,
  }) =>
      Items(
        orderItemId: orderItemId ?? _orderItemId,
        title: title ?? _title,
        quantity: quantity ?? _quantity,
        unitPrice: unitPrice ?? _unitPrice,
        totalUnitPrice: totalUnitPrice ?? _totalUnitPrice,
        image: image ?? _image,
      );
  String? get orderItemId => _orderItemId;
  String? get title => _title;
  int? get quantity => _quantity;
  String? get unitPrice => _unitPrice;
  String? get totalUnitPrice => _totalUnitPrice;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_item_id'] = _orderItemId;
    map['title'] = _title;
    map['quantity'] = _quantity;
    map['unit_price'] = _unitPrice;
    map['total_unit_price'] = _totalUnitPrice;
    map['image'] = _image;
    return map;
  }
}

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
