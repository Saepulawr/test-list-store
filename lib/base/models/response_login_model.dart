import 'package:collection/collection.dart';

class ResponseLoginModel {
  final String? kind;
  final String? localId;
  final String? email;
  final String? displayName;
  final String? idToken;
  final bool? registered;
  final String? refreshToken;
  final String? expiresIn;

  const ResponseLoginModel({
    this.kind,
    this.localId,
    this.email,
    this.displayName,
    this.idToken,
    this.registered,
    this.refreshToken,
    this.expiresIn,
  });

  factory ResponseLoginModel.fromJson(dynamic json) {
    return ResponseLoginModel(
      kind: json['kind'] as String?,
      localId: json['localId'] as String?,
      email: json['email'] as String?,
      displayName: json['displayName'] as String?,
      idToken: json['idToken'] as String?,
      registered: json['registered'] as bool?,
      refreshToken: json['refreshToken'] as String?,
      expiresIn: json['expiresIn'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'localId': localId,
        'email': email,
        'displayName': displayName,
        'idToken': idToken,
        'registered': registered,
        'refreshToken': refreshToken,
        'expiresIn': expiresIn,
      };

  ResponseLoginModel copyWith({
    String? kind,
    String? localId,
    String? email,
    String? displayName,
    String? idToken,
    bool? registered,
    String? refreshToken,
    String? expiresIn,
  }) {
    return ResponseLoginModel(
      kind: kind ?? this.kind,
      localId: localId ?? this.localId,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      idToken: idToken ?? this.idToken,
      registered: registered ?? this.registered,
      refreshToken: refreshToken ?? this.refreshToken,
      expiresIn: expiresIn ?? this.expiresIn,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResponseLoginModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      kind.hashCode ^
      localId.hashCode ^
      email.hashCode ^
      displayName.hashCode ^
      idToken.hashCode ^
      registered.hashCode ^
      refreshToken.hashCode ^
      expiresIn.hashCode;
}
