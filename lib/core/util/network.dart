import 'dart:convert';
import 'dart:io';

import 'package:bloc_cubit_example/core/exception/base_exception.dart';
import 'package:bloc_cubit_example/core/model/base_error.dart';
import 'package:bloc_cubit_example/core/model/response.dart';
import 'package:bloc_cubit_example/core/navigation/navigation_handler.dart';


class NetworkUtil {
  static String getPrettyJSONString(String jsonObject) {
    // var object = json.decode(jsonObject);
    var prettyString = const JsonEncoder.withIndent('  ').convert(jsonObject);

    return prettyString;
  }

  static bool typesEqual<T1, T2>() => T1 == T2;

  static Future<void> apiCaller<A>(
      {required Future<A> Function() service,
      Function(BaseErrorModel error)? onError,
      Function? onSuccess,
      bool isPopWhenError = false,
      bool isCloseLoadingWhenError = true}) async {
    return service.call().then((A value) {
      if (onSuccess != null) {
        onSuccess(value);
      }
    }, onError: (e) {
      ///  This is used instead of changeLoading(false). Because changeLoading function in BaseViewModel
      if (isCloseLoadingWhenError) NavigationHandler.instance.pop();

      if (e is BaseException) {
        _checkError(onError, e.errorModel ?? BaseErrorModel.defaultError(), isPopWhenError);
      } else {
        _checkError(onError, BaseErrorModel.defaultError(), isPopWhenError);
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

  static Future<void> _checkError(Function(BaseErrorModel error)? onError, BaseErrorModel errorModel, bool isPopWhenError) async {
    final statusCode = errorModel.dioError?.response?.statusCode ?? HttpStatus.internalServerError;

    if (statusCode == HttpStatus.unauthorized) {
      HttpErrorCode errorCode = HttpErrorCode.getCode(errorModel.errorCode);
      switch (errorCode) {
        case HttpErrorCode.customer_authorization_error:
          _handleDtSessionTimeOut();
          break;
        case HttpErrorCode.customer_bank_authorization_error:
          _handleBankingSessionTimeOut();
          break;
        case HttpErrorCode.other_session_login:
          _showOtherSessionError();
          break;
        case HttpErrorCode.first_login:
          _showError(isPopWhenError, ResourceManager.instance?.getResource(ResourceKey.error_messages_first_login) ?? "");
          break;
        case HttpErrorCode.force_password_change:
          _showError(
              isPopWhenError, ResourceManager.instance?.getResource(ResourceKey.error_messages_force_password_change) ?? "");
          break;
        case HttpErrorCode.blocked_account:
          _showError(isPopWhenError, ResourceManager.instance?.getResource(ResourceKey.error_messages_blocked_account) ?? "");
          break;
        case HttpErrorCode.none:
          _showError(isPopWhenError, ResourceManager.instance?.getResource(ResourceKey.unexpected_error) ?? "");
          break;
      }
    } else if (statusCode == HttpStatus.forbidden) {
      if (SessionManagerBanking.instance.isUserLoggedIn) {
        _handleBankingSessionTimeOut();
      } else {
        _handleDtSessionTimeOut();
        DeeplinkManager.instance?.handleDeeplink(DeeplinkManager.instance?.createPathFromMenuKey(MenuKey.ask_engineer) ?? "");
      }
    } else {
      if (onError == null) {
        _showError(isPopWhenError, errorModel.message ?? "");
        //todo maybe errorModel.detailMessage sent to firebase crashlytics
      } else {
        onError(errorModel);
      }
    }
  }

  static void _showOtherSessionError() {
    DialogCreator.instance
        ?.getWarningDialogBuilder(ResourceManager.instance?.getResource(ResourceKey.common_dialog_warning_title) ?? "",
            ResourceManager.instance?.getResource(ResourceKey.other_session_login) ?? "")
        .setPositiveButtonText(ResourceManager.instance?.getResource(ResourceKey.common_dialog_ok_button) ?? "")
        .setPositiveButtonClick(() {
      SessionManagerBanking.instance.logOff();
      NavigationHandler.instance?.pop();
      NavigationHandler.instance?.popUntil(MenuKey.main);
    }).buildAndShow();
  }

  static void _showError(bool isPopWhenError, String message) {
    DialogCreator.instance
        ?.getWarningDialogBuilder(ResourceManager.instance?.getResource(ResourceKey.common_dialog_warning_title) ?? "", message)
        .setPositiveButtonText(ResourceManager.instance?.getResource(ResourceKey.common_dialog_ok_button) ?? "")
        .setPositiveButtonClick(() {
      NavigationHandler.instance?.pop();
      if (isPopWhenError) NavigationHandler.instance?.pop();
    }).buildAndShow();
  }

  static Future<void> _handleBankingSessionTimeOut() async {
    SessionManagerBanking.instance.logOff();
    await NavigationHandler.instance?.popUntil(MenuKey.main);
    DeeplinkManager.instance?.handleDeeplink(DeeplinkManager.instance?.createPathFromMenuKey(MenuKey.bank) ?? "");
  }

  static Future<void> _handleDtSessionTimeOut() async {
    SessionManagerDT.instance.logOff();
    SessionManagerBanking.instance.logOff();
    await NavigationHandler.instance?.popUntil(MenuKey.main);
  }
}
