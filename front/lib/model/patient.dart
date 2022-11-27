import 'gender.dart';

class Patient {
  final int? id;
  final String? name;
  final String? documentNumber;
  final DateTime? createDate;
  final DateTime? birthDate;
  final Gender? gender;

  Patient(this.id, this.name, this.documentNumber, this.createDate,
      this.birthDate, this.gender);

  static convertPatient(patient) {
    if (patient != null) {
      return Patient(
          patient['id'],
          patient['name'],
          patient['documentNumber'],
          DateTime.parse(patient['createDate']),
          DateTime.parse(patient['birthDate']),
          Gender.convertGender(patient['gender']));
    } else {
      return Patient(null, null, null, null, null, null);
    }
  }
}
