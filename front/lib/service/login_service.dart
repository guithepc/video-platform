import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../config/config.dart';

class LoginService {
  static Future<http.Response?> login(String user, String password) async {
    const storage = FlutterSecureStorage();

    var url = "${environment["baseUrl"]}/login";

    var header = {"Content-Type": "application/json"};

    Map params = {"login": user, "password": password};

    var _body = json.encode(params);

    var response =
        await http.post(Uri.parse(url), headers: header, body: _body);

    if (response.statusCode == 200) {
      var token = response.body;
      await storage.write(key: 'jwt', value: token);
      return response;
    } else {
      throw Exception('Failed to login');
    }
  }
}
