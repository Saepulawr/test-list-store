import 'package:collection/collection.dart';

import 'firebase.dart';

class TokenPayloadModel {
  final List<String>? groups;
  final String? iss;
  final String? aud;
  final int? authTime;
  final String? userId;
  final String? sub;
  final int? iat;
  final int? exp;
  final String? email;
  final bool? emailVerified;
  final Firebase? firebase;

  const TokenPayloadModel({
    this.groups,
    this.iss,
    this.aud,
    this.authTime,
    this.userId,
    this.sub,
    this.iat,
    this.exp,
    this.email,
    this.emailVerified,
    this.firebase,
  });

  factory TokenPayloadModel.fromJson(Map<String, dynamic> json) {
    return TokenPayloadModel(
      groups: List.from(json['groups']).map((e) => e.toString()).toList(),
      iss: json['iss'] as String?,
      aud: json['aud'] as String?,
      authTime: json['auth_time'] as int?,
      userId: json['user_id'] as String?,
      sub: json['sub'] as String?,
      iat: json['iat'] as int?,
      exp: json['exp'] as int?,
      email: json['email'] as String?,
      emailVerified: json['email_verified'] as bool?,
      firebase: json['firebase'] == null
          ? null
          : Firebase.fromJson(json['firebase'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'groups': groups,
        'iss': iss,
        'aud': aud,
        'auth_time': authTime,
        'user_id': userId,
        'sub': sub,
        'iat': iat,
        'exp': exp,
        'email': email,
        'email_verified': emailVerified,
        'firebase': firebase?.toJson(),
      };

  TokenPayloadModel copyWith({
    List<String>? groups,
    String? iss,
    String? aud,
    int? authTime,
    String? userId,
    String? sub,
    int? iat,
    int? exp,
    String? email,
    bool? emailVerified,
    Firebase? firebase,
  }) {
    return TokenPayloadModel(
      groups: groups ?? this.groups,
      iss: iss ?? this.iss,
      aud: aud ?? this.aud,
      authTime: authTime ?? this.authTime,
      userId: userId ?? this.userId,
      sub: sub ?? this.sub,
      iat: iat ?? this.iat,
      exp: exp ?? this.exp,
      email: email ?? this.email,
      emailVerified: emailVerified ?? this.emailVerified,
      firebase: firebase ?? this.firebase,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! TokenPayloadModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      groups.hashCode ^
      iss.hashCode ^
      aud.hashCode ^
      authTime.hashCode ^
      userId.hashCode ^
      sub.hashCode ^
      iat.hashCode ^
      exp.hashCode ^
      email.hashCode ^
      emailVerified.hashCode ^
      firebase.hashCode;
}
