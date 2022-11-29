import 'dart:convert';

import 'package:front/model/available_date.dart';
import 'package:front/model/medical_appointment.dart';
import 'package:front/model/speciality.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../config/config.dart';
import '../model/doctor.dart';
import '../model/patient.dart';
import '../model/status.dart';

class AppointmentService {
  static Future<List<MedicalAppointment>> findAllByUserId() async {
    const storage = FlutterSecureStorage();
    List<MedicalAppointment> listAppointment = <MedicalAppointment>[];

    var token = await storage.read(key: 'jwt');
    var url = "${environment["baseUrl"]}/medical-appointment/user";

    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      var parsed = jsonDecode(utf8.decode(response.bodyBytes));
      List<dynamic> appointments = parsed;

      appointments.forEach((appointment) {
        listAppointment.add(MedicalAppointment(
            appointment['id'],
            Patient.convertPatient(appointment['patient']),
            Doctor.convertDoctor(appointment['doctor']),
            Status.convertStatus(appointment['status']),
            Speciality.convertSpeciality(appointment['speciality']),
            appointment['observation'] ?? "",
            DateTime.parse(appointment['createDate']),
            DateTime.parse(appointment['appointmentDate']),
            appointment['statusId'] ?? 0));
      });
      return listAppointment;
    } else {
      throw Exception('Failed to get medical appointments');
    }
  }

  static Future<List<AvailableDate>> availableAppointmentDate(int id) async {
    const storage = FlutterSecureStorage();
    List<AvailableDate> listAvailableAppointment = [];

    var token = await storage.read(key: 'jwt');
    var url =
        "${environment["baseUrl"]}/medical-appointment/available-appointment-date?doctorId=$id";

    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      var parsed = jsonDecode(utf8.decode(response.bodyBytes));
      List<dynamic> dates = parsed;

      for (var date in dates) {
        listAvailableAppointment.add(AvailableDate.convertAvailableDate(date));
      }

      return listAvailableAppointment;
    } else {
      throw Exception('Failed to get medical appointments');
    }
  }

  static Future<MedicalAppointment> saveMedicalAppointment(
      MedicalAppointment medicalAppointment) async {
    const storage = FlutterSecureStorage();
    late MedicalAppointment returnMedicalAppointment;

    var token = await storage.read(key: 'jwt');
    var url = "${environment["baseUrl"]}/medical-appointment";
    var _body = jsonEncode(medicalAppointment.toJson());

    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: _body);

    if (response.statusCode == 200) {
      var parsed = jsonDecode(utf8.decode(response.bodyBytes));
      MedicalAppointment appointment =
          MedicalAppointment.convertMedicalApointment(parsed);

      return appointment;
    } else {
      throw Exception('Failed to save medical appointments');
    }
  }

  static Future<String> cancelAppointment(int id) async {
    const storage = FlutterSecureStorage();
    late MedicalAppointment returnMedicalAppointment;

    var token = await storage.read(key: 'jwt');
    var url = "${environment["baseUrl"]}/medical-appointment/${id}";

    var response = await http.delete(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      var parsed = jsonDecode(utf8.decode(response.bodyBytes));

      return "Cancelado com sucesso";
    } else {
      throw Exception('Failed to save medical appointments');
    }
  }
}
