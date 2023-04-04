abstract class ValidateUtil {
  static bool isFormValidated({List<int?>? idArray, List<String>? textArray}) {
    var idArrayValidate = true;
    var textArrayValidate = true;

    if (idArray != null) {
      idArrayValidate = !idArray.contains(null);
    }

    if (textArray != null) {
      for (final text in textArray) {
        if (text.isEmpty) return textArrayValidate = false;
      }
    }

    return idArrayValidate & textArrayValidate;
  }

  static bool isAnyItemNotNull({List<int?>? idArray, List<String>? textArray}) {
    var idArrayValidate = false;
    var textArrayValidate = false;

    if (idArray != null) {
      idArrayValidate = !idArray.contains(null);
    }

    if (textArray != null) {
      for (final text in textArray) {
        if (text.isNotEmpty) return textArrayValidate = true;
      }
    }

    return idArrayValidate || textArrayValidate;
  }
}
