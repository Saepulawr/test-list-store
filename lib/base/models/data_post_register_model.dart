import 'package:collection/collection.dart';

class DataPostRegisterModel {
  final String? email;
  final String? password;
  final String? gender;
  final String? birthDate;
  final String? name;
  final String? userType;

  const DataPostRegisterModel({
    this.email,
    this.password,
    this.gender,
    this.birthDate,
    this.name,
    this.userType,
  });

  factory DataPostRegisterModel.fromJson(dynamic json) {
    return DataPostRegisterModel(
      email: json['email'] as String?,
      password: json['password'] as String?,
      gender: json['gender'] as String?,
      birthDate: json['birth_date'] as String?,
      name: json['name'] as String?,
      userType: json['user_type'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'gender': gender,
        'birth_date': birthDate,
        'name': name,
        'user_type': userType,
      };

  DataPostRegisterModel copyWith({
    String? email,
    String? password,
    String? gender,
    String? birthDate,
    String? name,
    String? userType,
  }) {
    return DataPostRegisterModel(
      email: email ?? this.email,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      name: name ?? this.name,
      userType: userType ?? this.userType,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DataPostRegisterModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      email.hashCode ^
      password.hashCode ^
      gender.hashCode ^
      birthDate.hashCode ^
      name.hashCode ^
      userType.hashCode;
}
