import 'package:collection/collection.dart';

class Identities {
  final List<String>? email;

  const Identities({this.email});

  factory Identities.fromJson(Map<String, dynamic> json) => Identities(
        email: List.from(json['email']).map((e) => e.toString()).toList(),
      );

  Map<String, dynamic> toJson() => {
        'email': email,
      };

  Identities copyWith({
    List<String>? email,
  }) {
    return Identities(
      email: email ?? this.email,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Identities) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => email.hashCode;
}
