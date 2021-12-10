import 'package:flutter/material.dart';

import 'package:flufin/services/services.dart';

class ServerService extends ChangeNotifier {
  final _storage = SecureStorage();
  final _api = ApiService();

  Future connect(String address) async {
    await _api.get('$address/System/Info/Public');
  }

  Future<void> saveServer(String server) async {
    await _storage.saveServer(server);
  }

  Future<String> readServer() async {
    return await _storage.readServer();
  }
}
