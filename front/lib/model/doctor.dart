import 'package:front/model/speciality.dart';

import 'gender.dart';

class Doctor {
  final int? id;
  final String? name;
  final String? crm;
  final String? documentNumber;
  final DateTime? createDate;
  final DateTime? birthDate;
  final Speciality? speciality;
  final Gender? gender;
  final String? startAt;
  final String? endAt;

  Doctor(this.id, this.name, this.crm, this.documentNumber, this.createDate,
      this.birthDate, this.speciality, this.gender, this.startAt, this.endAt);

  static convertDoctor(doctor) {
    if (doctor != null) {
      return Doctor(
          doctor['id'],
          doctor['name'],
          doctor['crm'],
          doctor['documentNumber'],
          DateTime.parse(doctor['createDate']),
          DateTime.parse(doctor['birthDate']),
          Speciality.convertSpeciality(doctor['speciality']),
          Gender.convertGender(doctor['gender']),
          doctor['startAt'],
          doctor['endAt']);
    } else {
      return Doctor(null, null, null, null, null, null, null, null, null, null);
    }
  }
}
