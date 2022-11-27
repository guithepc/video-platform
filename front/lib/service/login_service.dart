import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginService {
  static Future<http.Response?> login(String user, String password) async {
    final storage = FlutterSecureStorage();

    var url = "http://192.168.0.101:8080/login";

    var header = {"Content-Type": "application/json"};

    Map params = {"login": user, "password": password};

    var _body = json.encode(params);

    var response =
        await http.post(Uri.parse(url), headers: header, body: _body);

    if (response.statusCode == 200) {
      var token = response.body;
      await storage.write(key: 'jwt', value: token);
      await storage.read(key: 'jwt');
      return response;
    } else {
      throw Exception('Failed to login');
    }
  }
}
