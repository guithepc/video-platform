import 'package:front/model/clinic.dart';
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
  final Clinic? clinic;
  final String? profileImage;

  Doctor(
      this.id,
      this.name,
      this.crm,
      this.documentNumber,
      this.createDate,
      this.birthDate,
      this.speciality,
      this.gender,
      this.startAt,
      this.endAt,
      this.clinic,
      this.profileImage);

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
          doctor['endAt'],
          Clinic.convertClinic(doctor['clinic']),
          doctor['profileImage']);
    } else {
      return Doctor(null, null, null, null, null, null, null, null, null, null,
          null, null);
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['crm'] = crm;
    _data['documentNumber'] = documentNumber;
    _data['createDate'] = createDate;
    _data['birthDate'] = birthDate;
    _data['speciality'] = speciality?.toJson();
    _data['gender'] = gender?.toJson();
    _data['startAt'] = startAt;
    _data['endAt'] = endAt;
    _data['clinic'] = clinic?.toJson();
    _data['profileImage'] = profileImage;
    return _data;
  }
}
