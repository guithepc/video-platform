import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:front/model/doctor.dart';
import 'package:http/http.dart' as http;

class DoctorService {
  static Future<List<Doctor>> findDoctorBySpeciality(int id) async {
    const storage = FlutterSecureStorage();
    List<Doctor> listDoctor = <Doctor>[];

    var token = await storage.read(key: 'jwt');
    var url = "http://192.168.0.101:8080/doctor/speciality/${id}";
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
      List<dynamic> doctors = parsed;

      doctors.forEach((doctor) {
        listDoctor.add(
          Doctor.convertDoctor(doctor),
        );
      });
      return listDoctor;
    } else {
      throw Exception('Failed to login');
    }
  }
}
