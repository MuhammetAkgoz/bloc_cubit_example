import 'package:bloc_cubit_example/core/util/logger.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart' as material;

@material.immutable
class NeoAES {
  const NeoAES._();
  static const String PADDING = 'PKCS7';

  static AES getAesKey(String key) {
    final aesKey = Key.fromUtf8(key);

    return AES(aesKey, mode: AESMode.cbc, padding: PADDING);
  }

  static String decrypt(String decryptText, String decryptKey) {
    try {
      final encryptor = Encrypter(getAesKey(decryptKey));
      return encryptor.decrypt64(decryptText, iv: IV.fromUtf8(decryptKey));
    } catch (e) {
      NeoLogger.e(e.toString());
    }
    return '';
  }

  static String encrypt(String encryptText, String encryptKey) {
    try {
      final encryptor = Encrypter(getAesKey(encryptKey));

      return encryptor.encrypt(encryptText, iv: IV.fromUtf8(encryptKey)).base64;
    } catch (e) {
      NeoLogger.e(e.toString());
    }
    return '';
  }
}
