import '../errors/failure.dart';

sealed class ApiResult<T> {
  const ApiResult();
  R when<R>({required R Function(T data) success, required R Function(Failure failure) failure}) {
    final value = this;
    if (value is ApiSuccess<T>) return success(value.data);
    if (value is ApiFailure<T>) return failure(value.failure);
    throw StateError('Unhandled ApiResult type');
  }
}
class ApiSuccess<T> extends ApiResult<T> { final T data; const ApiSuccess(this.data); }
class ApiFailure<T> extends ApiResult<T> { final Failure failure; const ApiFailure(this.failure); }
