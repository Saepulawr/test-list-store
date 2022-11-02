import 'package:collection/collection.dart';

class ApiError<T> {
  final String? code;
  final String? description;
  final T? data;
  const ApiError({this.code, this.description, this.data});

  Map<String, dynamic> toJson() => {
        'code': code,
        'description': description,
        'data': data?.toString(),
      };

  ApiError copyWith({
    String? code,
    String? description,
    String? data,
  }) {
    return ApiError(
      code: code ?? this.code,
      description: description ?? this.description,
      data: data ?? this.data,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ApiError) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => code.hashCode ^ description.hashCode ^ data.hashCode;
}
