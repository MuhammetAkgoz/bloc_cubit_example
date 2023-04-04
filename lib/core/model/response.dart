import 'package:bloc_cubit_example/core/model/base_error.dart';

abstract class IResponseModel<T> {
  T? data;
  BaseErrorModel? error;
}

abstract class IErrorModel {
  void statusCode() {}
}

class BaseResponseModel<T> extends IResponseModel<T> {
  BaseResponseModel({this.data, this.error});

  @override
  final T? data;
  @override
  final BaseErrorModel? error;
}
