
import 'dart:convert' as convert;
import 'dart:convert';

import 'package:encrypt/encrypt.dart';

class XEncryptUtil {
  /*
  * Base64加密
  */
  static String encodeBase64(String data){
    var content = utf8.encode(data);
    var digest = base64Encode(content);
    return digest;
  }

  /*
  * Base64解密
  */
  static String decodeBase64(String data){
    return String.fromCharCodes(base64Decode(data));
  }

  // md5 加密 32位小写
  static String encodeMd5(String plainText) {
    return XEncryptUtil.encodeMd5(plainText);
  }

  //AES加密
  static aesEncrypt(plainText,_key,_iv) {
    try {
      final key = Key.fromUtf8(_key);
      final iv = IV.fromUtf8(_iv);
      final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
      final encrypted = encrypter.encrypt(plainText, iv: iv);
      return encrypted.base64;
    } catch (err) {
      return "AES 加密失败:$err";
    }
  }

  //AES解密
  static dynamic aesDecrypt(encrypted,_key,_iv) {
    try {
      final key = Key.fromUtf8(_key);
      final iv = IV.fromUtf8(_iv);
      final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
      final decrypted = encrypter.decrypt64(encrypted, iv: iv);
      return decrypted;
    } catch (err) {
      return "AES 解密失败:$err";
    }
  }
}