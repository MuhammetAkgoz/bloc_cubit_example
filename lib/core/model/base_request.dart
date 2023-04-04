import 'package:bloc_cubit_example/core/model/IBase.dart';

abstract class IBaseRequestModel<T> extends IBaseModel<T> {
  @override
  String toString() {
    return toJson().toString();
  }
}
