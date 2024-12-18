import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_response.freezed.dart';

typedef BaseReturnType = Future<RemoteResponse<dynamic>>;

@freezed
class RemoteResponse<T> with _$RemoteResponse {
  const factory RemoteResponse.success(T data) = _Success<T>;

  const factory RemoteResponse.failure(T data) = _Failure<T>;
}
