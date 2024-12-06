

abstract class DataState<T> {
  final T? data;
  final String? dioError;
  const DataState({this.data, this.dioError});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(String dioError) : super(dioError: dioError);
}
