import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:front/config/config.dart';
import 'package:http/http.dart' as http;

import '../model/user.dart';

class UserService {
  static Future<User> getCurrentUser() async {
    const storage = FlutterSecureStorage();
    late User currentUser;

    var token = await storage.read(key: 'jwt');
    var url = "${environment["baseUrl"]}/user/current";
    var header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      var parsed = jsonDecode(utf8.decode(response.bodyBytes));

      currentUser = User.convertUser(parsed);
      return currentUser;
    } else {
      throw Exception('Failed to login');
    }
  }
}
