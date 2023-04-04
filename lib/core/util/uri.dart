import 'package:bloc_cubit_example/core/util/logger.dart';

class UriUtil {
  /// returns menuKey value if there is an exist query param from given [uriString]
  static String getMenuKeyFromUri(
    String uriString,
  ) {
    final uri = Uri.dataFromString(uriString);
    final menuKey = uri.queryParameters['menuKey'];
    return menuKey ?? uriString;
  }

  /// returns all query parameters as map [uriString]
  static Map<String, String> convertParamsToMap(String uriString, List<String> argsKey) {
    final queryMap = <String, String>{};

    try {
      for (final element in argsKey) {
        queryMap.addAll({element: getQueryParamFromUri(uriString, element)});
      }
    } catch (e) {
      NeoLogger.d(e.toString());
    }

    return queryMap;
  }

  /// returns menuKey value if there is an exist query param from given [uriString]
  static String getQueryParamFromUri(String uriString, String key) {
    final uri = Uri.dataFromString(uriString);
    final queryParam = uri.queryParameters[key];
    return queryParam ?? '';
  }

  /// Convert map parameter to query
  static String _mapToQueryString(Map<String, String> queryParameters, {required String deeplinkSuffix}) {
    final buffer = StringBuffer(deeplinkSuffix);
    for (final mapEntry in queryParameters.entries) {
      buffer.write('${mapEntry.key}=${mapEntry.value}&');
    }
    return buffer.toString();
  }
}
