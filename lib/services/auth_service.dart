import 'package:flutter/material.dart';

import 'package:flufin/services/services.dart';

class AuthService extends ChangeNotifier {
  final _storage = SecureStorage();
  final _api = ApiService();

  Future<String> readToken() async {
    return await _storage.readToken();
  }

  Future<String> readUserId() async {
    return await _storage.readUserId();
  }

  Future<void> deleteAll() async {
    return await _storage.deleteAll();
  }

  Future login(String username, String password) async {
    final resp = await _api.post(
      path: '/Users/authenticatebyname',
      data: {'Username': username, 'Pw': password},
    );
    await _storage.saveUserId(resp["User"]["Id"]);
    await _storage.saveToken(resp["AccessToken"]);
  }
}
