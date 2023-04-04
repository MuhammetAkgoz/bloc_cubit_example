import 'dart:convert';
import 'package:bloc_cubit_example/core/util/encryption/aes.dart';
import 'package:bloc_cubit_example/core/util/logger.dart';
import 'package:bloc_cubit_example/core/util/string.dart';
import 'package:crypto/crypto.dart';

class EncryptionUtil {
  static const String staticEncryptionKey = 'SKhoAAydSYimCSiK';
  static String encryptionKey = '';

  /// This method does static decryption
  static String staticDecrypt(String encryptedText) {
    if (encryptedText.isEmpty || staticEncryptionKey.isEmpty) return '';
    try {
      return NeoAES.decrypt(encryptedText, staticEncryptionKey);
    } catch (e) {
      NeoLogger.e(e.toString());
    }
    return '';
  }

  /// This method does static encryption
  static String staticEncrypt(String text) {
    if (text.isEmpty || staticEncryptionKey.isEmpty) return '';
    try {
      return NeoAES.encrypt(text, staticEncryptionKey);
    } catch (e) {
      NeoLogger.e(e.toString());
    }
    return '';
  }

  /// This method does decryption throughout the application
  static String decrypt(String? encryptedText) {
    if (StringUtil.isNullOrEmpty(encryptedText) || encryptionKey.isEmpty) return '';
    try {
      return NeoAES.decrypt(encryptedText!, encryptionKey);
    } catch (e) {
      NeoLogger.e(e.toString());
    }
    return '';
  }

  /// This method does static encryption throughout the application
  static String encrypt(String text) {
    if (text.isEmpty || encryptionKey.isEmpty) return '';
    try {
      return NeoAES.encrypt(text, encryptionKey);
    } catch (e) {
      NeoLogger.e(e.toString());
    }
    return '';
  }

  static void setEncryptionKey(String key) {
    try {
      encryptionKey = staticDecrypt(key);
    } catch (e) {
      NeoLogger.e(e.toString());
    }
  }

  static String _generateHashWithHMAC256(String data, String key) {
    try {
      final encodeKey = utf8.encode(key);
      final encodeBytes = utf8.encode(data);
      final hmacSha256 = Hmac(sha256, encodeKey); // HMAC-SHA256
      final digest = hmacSha256.convert(encodeBytes);
      return base64.encode(digest.bytes);
    } catch (e) {
      NeoLogger.e(e.toString());
      return '';
    }
  }

  static String generateDobHashWithHMAC256(String data) {
    return _generateHashWithHMAC256(data, encryptionKey);
  }

  static String manuelGenerateDobHashWithHMAC256(String data, String encryptionKey) {
    return _generateHashWithHMAC256(data, encryptionKey);
  }
}
