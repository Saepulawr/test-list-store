// ignore_for_file: depend_on_referenced_packages

import 'package:collection/collection.dart';

class Store {
  String? storeId;
  String? storeCode;
  String? storeName;
  String? address;
  String? dcId;
  String? dcName;
  String? accountId;
  String? accountName;
  String? subchannelId;
  String? subchannelName;
  String? channelId;
  String? channelName;
  String? areaId;
  String? areaName;
  String? regionId;
  String? regionName;
  String? latitude;
  String? longitude;

  Store({
    this.storeId,
    this.storeCode,
    this.storeName,
    this.address,
    this.dcId,
    this.dcName,
    this.accountId,
    this.accountName,
    this.subchannelId,
    this.subchannelName,
    this.channelId,
    this.channelName,
    this.areaId,
    this.areaName,
    this.regionId,
    this.regionName,
    this.latitude,
    this.longitude,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        storeId: json['store_id'] as String?,
        storeCode: json['store_code'] as String?,
        storeName: json['store_name'] as String?,
        address: json['address'] as String?,
        dcId: json['dc_id'] as String?,
        dcName: json['dc_name'] as String?,
        accountId: json['account_id'] as String?,
        accountName: json['account_name'] as String?,
        subchannelId: json['subchannel_id'] as String?,
        subchannelName: json['subchannel_name'] as String?,
        channelId: json['channel_id'] as String?,
        channelName: json['channel_name'] as String?,
        areaId: json['area_id'] as String?,
        areaName: json['area_name'] as String?,
        regionId: json['region_id'] as String?,
        regionName: json['region_name'] as String?,
        latitude: json['latitude'] as String?,
        longitude: json['longitude'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'store_id': storeId,
        'store_code': storeCode,
        'store_name': storeName,
        'address': address,
        'dc_id': dcId,
        'dc_name': dcName,
        'account_id': accountId,
        'account_name': accountName,
        'subchannel_id': subchannelId,
        'subchannel_name': subchannelName,
        'channel_id': channelId,
        'channel_name': channelName,
        'area_id': areaId,
        'area_name': areaName,
        'region_id': regionId,
        'region_name': regionName,
        'latitude': latitude,
        'longitude': longitude,
      };

  Store copyWith({
    String? storeId,
    String? storeCode,
    String? storeName,
    String? address,
    String? dcId,
    String? dcName,
    String? accountId,
    String? accountName,
    String? subchannelId,
    String? subchannelName,
    String? channelId,
    String? channelName,
    String? areaId,
    String? areaName,
    String? regionId,
    String? regionName,
    String? latitude,
    String? longitude,
  }) {
    return Store(
      storeId: storeId ?? this.storeId,
      storeCode: storeCode ?? this.storeCode,
      storeName: storeName ?? this.storeName,
      address: address ?? this.address,
      dcId: dcId ?? this.dcId,
      dcName: dcName ?? this.dcName,
      accountId: accountId ?? this.accountId,
      accountName: accountName ?? this.accountName,
      subchannelId: subchannelId ?? this.subchannelId,
      subchannelName: subchannelName ?? this.subchannelName,
      channelId: channelId ?? this.channelId,
      channelName: channelName ?? this.channelName,
      areaId: areaId ?? this.areaId,
      areaName: areaName ?? this.areaName,
      regionId: regionId ?? this.regionId,
      regionName: regionName ?? this.regionName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Store) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      storeId.hashCode ^
      storeCode.hashCode ^
      storeName.hashCode ^
      address.hashCode ^
      dcId.hashCode ^
      dcName.hashCode ^
      accountId.hashCode ^
      accountName.hashCode ^
      subchannelId.hashCode ^
      subchannelName.hashCode ^
      channelId.hashCode ^
      channelName.hashCode ^
      areaId.hashCode ^
      areaName.hashCode ^
      regionId.hashCode ^
      regionName.hashCode ^
      latitude.hashCode ^
      longitude.hashCode;
}
