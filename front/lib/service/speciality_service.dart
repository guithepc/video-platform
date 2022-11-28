import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:front/model/speciality.dart';
import 'package:http/http.dart' as http;

import '../config/config.dart';

class SpecialityService {
  static Future<List<Speciality>> findAllSpeciality() async {
    const storage = FlutterSecureStorage();
    List<Speciality> listSpeciality = <Speciality>[];

    var token = await storage.read(key: 'jwt');
    var url = "${environment["baseUrl"]}/speciality";
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
      List<dynamic> specialitys = parsed;

      specialitys.forEach((speciality) {
        listSpeciality.add(Speciality(speciality['id'], speciality['name']));
      });
      return listSpeciality;
    } else {
      throw Exception('Failed to login');
    }
  }
}
