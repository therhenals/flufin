import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  Future<void> saveServer(String server) async {
    await _storage.write(key: 'server', value: server);
  }

  Future<String> readServer() async {
    return await _storage.read(key: 'server') ?? '';
  }

  Future<void> saveToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  Future<String> readToken() async {
    return await _storage.read(key: 'token') ?? '';
  }

  Future<void> saveUserId(String userId) async {
    await _storage.write(key: 'userId', value: userId);
  }

  Future<String> readUserId() async {
    return await _storage.read(key: 'userId') ?? '';
  }

  Future<void> deleteAll() async {
    return await _storage.deleteAll();
  }
}
