import 'package:meta_shop/model/massage_model.dart';

class DepartmentModel {
  DepartmentModel({
    this.msg,
    this.data,
  });

  DepartmentModel.fromJson(dynamic json) {
    msg = json['msg'] != null ? MassageModel.fromJson(json['msg']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  MassageModel? msg;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (msg != null) {
      map['msg'] = msg!.toJson();
    }
    if (data != null) {
      map['data'] = data!.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.department,
  });

  Data.fromJson(dynamic json) {
    if (json['department'] != null) {
      department = [];
      json['department'].forEach((v) {
        department!.add(Department.fromJson(v));
      });
    }
  }
  List<Department>? department;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (department != null) {
      map['department'] = department!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Department {
  Department({
    this.id,
    this.name,
    this.subDepartment,
    this.select = false,
  });

  Department.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    if (json['subDepartment'] != null) {
      subDepartment = [];
      json['subDepartment'].forEach((v) {
        subDepartment!.add(SubDepartment.fromJson(v));
      });
    }
  }
  String? id;
  String? name;
  bool? select;
  List<SubDepartment>? subDepartment;

  set selected(bool? select) {
    this.select = select;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (subDepartment != null) {
      map['subDepartment'] = subDepartment!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class SubDepartment {
  SubDepartment({
    this.id,
    this.name,
  });

  SubDepartment.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  String? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
