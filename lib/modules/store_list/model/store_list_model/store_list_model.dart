// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:collection/collection.dart';

import 'store.dart';

class StoreListModel {
  List<Store>? stores;
  String? status;
  String? message;

  StoreListModel({this.stores, this.status, this.message});

  factory StoreListModel.fromJson(dynamic jsonRaw) {
    Map<String, dynamic> json = {};
    if (jsonRaw is String) {
      json = jsonDecode(jsonRaw);
    } else {
      json = jsonRaw;
    }
    return StoreListModel(
      stores: (json['stores'] as List<dynamic>?)
          ?.map((e) => Store.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'stores': stores?.map((e) => e.toJson()).toList(),
        'status': status,
        'message': message,
      };

  StoreListModel copyWith({
    List<Store>? stores,
    String? status,
    String? message,
  }) {
    return StoreListModel(
      stores: stores ?? this.stores,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! StoreListModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => stores.hashCode ^ status.hashCode ^ message.hashCode;
}
