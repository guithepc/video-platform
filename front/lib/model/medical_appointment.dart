class MedicalAppointment {
  final int meaId;
  final String doctor;
  final DateTime dateAppointment;
  final double costAppointment;
  final String doctorSpecialty;
  final String appointmentObservations;
  final double distance;
  final String address;
  final String doctorHospital;

  MedicalAppointment(
      this.meaId,
      this.doctor,
      this.dateAppointment,
      this.costAppointment,
      this.doctorSpecialty,
      this.appointmentObservations,
      this.distance,
      this.address,
      this.doctorHospital);
}
