import 'package:front/model/patient.dart';

import 'doctor.dart';

class User {
  final int id;
  final String login;
  final Patient? patient;
  final Doctor? doctor;

  User(this.id, this.login, this.patient, this.doctor);

  static convertUser(user) {
    return User(
        user['id'],
        user['login'],
        Patient.convertPatient(user?['patient'] ?? null),
        Doctor.convertDoctor(user?['doctor'] ?? null));
  }
}
