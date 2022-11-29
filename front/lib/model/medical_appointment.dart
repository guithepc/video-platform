import 'package:front/model/patient.dart';
import 'package:front/model/speciality.dart';
import 'package:front/model/status.dart';
import 'package:front/model/user.dart';

import 'doctor.dart';

class MedicalAppointment {
  final int? id;
  final Patient? patient;
  final Doctor? doctor;
  final Status? status;
  final Speciality? speciality;
  final String? observation;
  final DateTime? createDate;
  final DateTime? appointmentDate;
  final int? statusId;

  MedicalAppointment(
      this.id,
      this.patient,
      this.doctor,
      this.status,
      this.speciality,
      this.observation,
      this.createDate,
      this.appointmentDate,
      this.statusId);

  static convertMedicalApointment(medicalAppointment) {
    return MedicalAppointment(
        medicalAppointment['id'],
        Patient.convertPatient(medicalAppointment['patient']),
        Doctor.convertDoctor(medicalAppointment['doctor']),
        Status.convertStatus(medicalAppointment['status']),
        Speciality.convertSpeciality(medicalAppointment['speciality']),
        medicalAppointment['observation'],
        DateTime.parse(medicalAppointment['createDate']),
        DateTime.parse(medicalAppointment['appointmentDate']),
        medicalAppointment['statusId']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['patient'] = patient?.toJson();
    _data['doctor'] = doctor?.toJson();
    _data['status'] = status?.toJson();
    _data['speciality'] = speciality?.toJson();
    _data['observation'] = observation;
    _data['createDate'] = createDate?.toIso8601String();
    _data['appointmentDate'] = appointmentDate?.toIso8601String();
    _data['statusId'] = statusId;
    return _data;
  }
}
