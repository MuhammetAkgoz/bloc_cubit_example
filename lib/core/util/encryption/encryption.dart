import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:neo_flutter_base/core/util/encryption/aes.dart';
import 'package:neo_flutter_base/core/util/neo_logger.dart';
import 'package:neo_flutter_base/core/util/string.dart';

class EncryptionUtil {
  static const String staticEncryptionKey = "SKhoAAydSYimCSiK";
  static String encryptionKey = "";

  /// This method does static decryption
  static String staticDecrypt(String encryptedText) {
    if (encryptedText.isEmpty || staticEncryptionKey.isEmpty) return "";
    try {
      return NeoAes.decrypt(encryptedText, staticEncryptionKey);
    } catch (e) {
      NeoLogger.instance.e(e.toString());
    }
    return "";
  }

  /// This method does static encryption
  static String staticEncrypt(String text) {
    if (text.isEmpty || staticEncryptionKey.isEmpty) return "";
    try {
      return NeoAes.encrypt(text, staticEncryptionKey);
    } catch (e) {
      NeoLogger.instance.e(e.toString());
    }
    return "";
  }

  /// This method does decryption throughout the application
  static String decrypt(String? encryptedText) {
    if (StringUtil.isNullOrEmpty(encryptedText) || encryptionKey.isEmpty) return "";
    try {
      return NeoAes.decrypt(encryptedText!, encryptionKey);
    } catch (e) {
      NeoLogger.instance.e(e.toString());
    }
    return "";
  }

  /// This method does static encryption throughout the application
  static String encrypt(String text) {
    if (text.isEmpty || encryptionKey.isEmpty) return "";
    try {
      return NeoAes.encrypt(text, encryptionKey);
    } catch (e) {
      NeoLogger.instance.e(e.toString());
    }
    return "";
  }

  static void setEncryptionKey(String key) {
    try {
      encryptionKey = staticDecrypt(key);
    } catch (e) {
      NeoLogger.instance.e(e.toString());
    }
  }

  static String _generateHashWithHMAC256(String data, String key) {
    try {
      var encodeKey = utf8.encode(key);
      var encodeBytes = utf8.encode(data);
      var hmacSha256 = Hmac(sha256, encodeKey); // HMAC-SHA256
      var digest = hmacSha256.convert(encodeBytes);
      return base64.encode(digest.bytes);
    } catch (e) {
      NeoLogger.instance.e(e.toString());
      return "";
    }
  }

  static String generateDobHashWithHMAC256(String data) {
    return _generateHashWithHMAC256(data, encryptionKey);
  }

  static String manuelGenerateDobHashWithHMAC256(String data, String encryptionKey) {
    return _generateHashWithHMAC256(data, encryptionKey);
  }
}
