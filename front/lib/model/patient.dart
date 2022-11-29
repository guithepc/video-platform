import 'gender.dart';

class Patient {
  final int? id;
  final String? name;
  final String? documentNumber;
  final DateTime? createDate;
  final DateTime? birthDate;
  final Gender? gender;
  final String? profileImage;

  Patient(this.id, this.name, this.documentNumber, this.createDate,
      this.birthDate, this.gender, this.profileImage);

  static convertPatient(patient) {
    if (patient != null) {
      return Patient(
          patient['id'],
          patient['name'],
          patient['documentNumber'],
          DateTime.parse(patient['createDate']),
          DateTime.parse(patient['birthDate']),
          Gender.convertGender(patient['gender']),
          patient['profileImage']);
    } else {
      return Patient(null, null, null, null, null, null, null);
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['documentNumber'] = documentNumber;
    _data['createDate'] = createDate;
    _data['birthDate'] = birthDate;
    _data['gender'] = gender?.toJson();
    _data['profileImage'] = profileImage;
    return _data;
  }
}
