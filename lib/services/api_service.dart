import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:flufin/models/models.dart';
import 'package:flufin/services/services.dart';

class ApiService {
  final _storage = SecureStorage();
  final _dio = Dio();

  Future<String> authHeader() async {
    final PackageInfo packageInfos = await PackageInfo.fromPlatform();
    final DeviceInfo deviceInfo = await DeviceInfo.getCurrentDeviceInfo();

    const name = 'Flufin';
    final device = deviceInfo.host;
    final deviceId = deviceInfo.id;
    final version =
        packageInfos.buildNumber.isEmpty ? 'Unknown' : packageInfos.version;
    final String token = await _storage.readToken();

    String auth =
        'MediaBrowser Client="$name", Device="$device", DeviceId="$deviceId", Version="$version"';
    if (token.isNotEmpty) auth += ', Token="$token"';
    return auth;
  }

  ApiService() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.baseUrl = await _storage.readServer();
        options.headers['x-emby-authorization'] = await authHeader();
        handler.next(options);
      },
    ));
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? query,
  }) async {
    final resp = await _dio.get(path, queryParameters: query);
    return resp;
  }

  Future post({
    required String path,
    required dynamic data,
  }) async {
    final resp = await _dio.post(
      path,
      data: data,
    );
    return resp.data;
  }
}
