import 'package:collection/collection.dart';

import 'identities.dart';

class Firebase {
  final Identities? identities;
  final String? signInProvider;

  const Firebase({this.identities, this.signInProvider});

  factory Firebase.fromJson(Map<String, dynamic> json) => Firebase(
        identities: json['identities'] == null
            ? null
            : Identities.fromJson(json['identities'] as Map<String, dynamic>),
        signInProvider: json['sign_in_provider'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'identities': identities?.toJson(),
        'sign_in_provider': signInProvider,
      };

  Firebase copyWith({
    Identities? identities,
    String? signInProvider,
  }) {
    return Firebase(
      identities: identities ?? this.identities,
      signInProvider: signInProvider ?? this.signInProvider,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Firebase) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => identities.hashCode ^ signInProvider.hashCode;
}
