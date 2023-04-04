import 'package:bloc_cubit_example/core/model/response.dart';
import 'package:dio/dio.dart';

class BaseErrorModel extends IErrorModel {
  BaseErrorModel(
      {this.message,
      this.errorCode,
      this.errorType,
      this.dioError,
      this.title,
      this.responseType,
      this.detailMessage,
      this.dioExceptionMessage = '',
      this.isError = false});

  BaseErrorModel.defaultError({String? message}) {
    isError = true;
    errorCode = 520;
    dioExceptionMessage = 'Dio Default Error';

    //Todo resource manager
    this.message = message ?? 'Beklenmeyen bir hata oluştu. Lütfen daha sonra tekrar deneyiniz!';
  }

  late bool isError;
  late String dioExceptionMessage;

  String? message;
  int? errorType;
  int? errorCode;
  String? title;
  String? detailMessage;
  int? responseType;
  DioError? dioError;

  BaseErrorModel generateErrorModel(Map<String, dynamic>? json) {
    try {
      if (json == null) {
        return BaseErrorModel.defaultError();
      }
      errorType = json['ErrorType'] as int?;
      errorCode = json['ErrorCode'] as int?;
      detailMessage = json['DetailMessage'] as String?;
      responseType = json['ResponseType'] as int?;
      message = json['Message'] as String?;
      title = json['Title'] as String?;
    } catch (e) {
      BaseErrorModel.defaultError();
    }
    return this;
  }
}
