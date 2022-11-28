import 'package:front/model/patient.dart';
import 'package:front/model/speciality.dart';
import 'package:front/model/status.dart';
import 'package:front/model/user.dart';

import 'doctor.dart';

class MedicalAppointment {
  final int id;
  final Patient patient;
  final Doctor doctor;
  final Status status;
  final Speciality speciality;
  final String observation;
  final DateTime createDate;
  final DateTime appointmentDate;
  final int statusId;

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
}
