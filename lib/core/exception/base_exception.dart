
import 'package:bloc_cubit_example/core/model/base_error.dart';
class BaseException implements Exception {
  BaseException(this.errorModel);
  BaseErrorModel? errorModel;
}