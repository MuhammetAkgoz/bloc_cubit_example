import 'dart:convert';

import 'package:bloc_cubit_example/core/exception/base_exception.dart';
import 'package:bloc_cubit_example/core/model/base_error.dart';
import 'package:bloc_cubit_example/core/model/response.dart';
import 'package:bloc_cubit_example/core/navigation/navigation_handler.dart';

class NetworkUtil {
  static String getPrettyJSONString(String jsonObject) {
    // var object = json.decode(jsonObject);
    final prettyString = const JsonEncoder.withIndent('  ').convert(jsonObject);

    return prettyString;
  }

  static bool typesEqual<T1, T2>() => T1 == T2;

  static Future<void> apiCaller<A>(
      {required Future<A> Function() service,
      void Function(BaseErrorModel error)? onError,
      void Function(A value)? onSuccess,
      bool isPopWhenError = false,
      bool isCloseLoadingWhenError = true}) async {
    return service.call().then((A value) {
      if (onSuccess != null) {
        onSuccess.call(value);
      }
    }, onError: (dynamic e) {
      ///  This is used instead of changeLoading(false). Because changeLoading function in BaseViewModel
      if (isCloseLoadingWhenError) NavigationHandler.instance.pop();

      if (e is BaseException) {
        onError?.call(e.errorModel ?? BaseErrorModel.defaultError());
      } else {
        onError?.call(BaseErrorModel.defaultError());
      }
    });
  }

  static Future<R> getResponse<R>(Future<IResponseModel<R>> serviceCall) async {
    final responseModel = await serviceCall;
    if (responseModel.data != null) {
      return responseModel.data!;
    }
    throw BaseException(responseModel.error);
  }
}
