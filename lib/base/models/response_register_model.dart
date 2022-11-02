import 'package:collection/collection.dart';

class ResponseRegisterModel {
  final int? id;
  final String? code;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final String? userType;
  final String? email;
  final String? birthDate;
  final String? gender;
  final bool? active;
  final String? uidFirebase;
  final String? status;
  final bool? returnSecureToken;

  const ResponseRegisterModel({
    this.id,
    this.code,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.userType,
    this.email,
    this.birthDate,
    this.gender,
    this.active,
    this.uidFirebase,
    this.status,
    this.returnSecureToken,
  });

  factory ResponseRegisterModel.fromJson(dynamic json) {
    return ResponseRegisterModel(
      id: json['id'] as int?,
      code: json['code'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      name: json['name'] as String?,
      userType: json['user_type'] as String?,
      email: json['email'] as String?,
      birthDate: json['birth_date'] as String?,
      gender: json['gender'] as String?,
      active: json['active'] as bool?,
      uidFirebase: json['uid_firebase'] as String?,
      status: json['status'] as String?,
      returnSecureToken: json['return_secure_token'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'name': name,
        'user_type': userType,
        'email': email,
        'birth_date': birthDate,
        'gender': gender,
        'active': active,
        'uid_firebase': uidFirebase,
        'status': status,
        'return_secure_token': returnSecureToken,
      };

  ResponseRegisterModel copyWith({
    int? id,
    String? code,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? userType,
    String? email,
    String? birthDate,
    String? gender,
    bool? active,
    String? uidFirebase,
    String? status,
    bool? returnSecureToken,
  }) {
    return ResponseRegisterModel(
      id: id ?? this.id,
      code: code ?? this.code,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      userType: userType ?? this.userType,
      email: email ?? this.email,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      active: active ?? this.active,
      uidFirebase: uidFirebase ?? this.uidFirebase,
      status: status ?? this.status,
      returnSecureToken: returnSecureToken ?? this.returnSecureToken,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResponseRegisterModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      code.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      name.hashCode ^
      userType.hashCode ^
      email.hashCode ^
      birthDate.hashCode ^
      gender.hashCode ^
      active.hashCode ^
      uidFirebase.hashCode ^
      status.hashCode ^
      returnSecureToken.hashCode;
}
