import 'package:get_storage/get_storage.dart';

class CacheUtils {
  final GetStorage _storage;

  CacheUtils(this._storage);

  static const _uidKey = 'uid';
  static const _userNameKey = 'user_name';
  static const _userPassKey = 'user_pass';
  static const _userEmailKey = 'user_email';
  static const _isHuaweiKey = 'false';
  static const _isFlagKey = 'true';

  bool isUserLoggedIn() {
    return _storage.hasData(_uidKey);
  }

  Future<void> saveFlag({
    required bool flag,
  }) async {
    _storage.write(_isFlagKey, flag);
  }

  String? getUID() {
    return _storage.read(_uidKey);
  }

  bool? getFlag() {
    return _storage.read(_isFlagKey);
  }

  String? getPass() {
    return _storage.read(_userPassKey);
  }

  String? getUserName() {
    return _storage.read(_userNameKey);
  }

  bool? getPhoneType() {
    return _storage.read(_isHuaweiKey);
  }

  Future<void> phoneType({
    required bool isHuawei,
  }) async {
    _storage.write(_isHuaweiKey, isHuawei);
  }

  Future<void> saveUserData({
    required String userId,
    required String userName,
    required String userPass,
    required String userEmail,
  }) async {
    _storage.write(_uidKey, userId);
    _storage.write(_userNameKey, userName);
    _storage.write(_userPassKey, userPass);
    _storage.write(_userEmailKey, userEmail);
  }

  Future<void> logout() async {
    _storage.erase();
  }
}
