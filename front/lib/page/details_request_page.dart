import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/model/medical_appointment.dart';
import 'package:front/model/speciality.dart';
import 'package:front/model/status.dart';
import 'package:front/model/user.dart';
import 'package:intl/intl.dart';
import '../model/doctor.dart';
import '../service/appointment_service.dart';
import '../service/user_service.dart';

class DetailsRequestPage extends StatefulWidget {
  const DetailsRequestPage({required this.selectedDateTime, this.doctor});
  final DateTime? selectedDateTime;
  final Doctor? doctor;

  @override
  State<StatefulWidget> createState() =>
      _DetailsRequestPage(selectedDateTime, doctor);
}

class _DetailsRequestPage extends State<DetailsRequestPage> {
  final DateTime? selectedDateTime;
  final Doctor? doctor;
  _DetailsRequestPage(this.selectedDateTime, this.doctor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[Text('Detalhes da solicitação')])),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: const Color.fromRGBO(224, 215, 215, 0.2),
        width: double.infinity,
        height: double.infinity,
        child: FutureBuilder<User>(
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            if (snapshot.hasData) {
              var user = snapshot.data;
              return Container(
                color: const Color.fromRGBO(224, 215, 215, 0.2),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Confira os dados antes de enviar',
                      style: TextStyle(fontSize: 18),
                    ),
                    Container(height: 15),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(height: 20),
                            const Icon(
                              Icons.person,
                              color: Colors.indigo,
                            ),
                          ],
                        ),
                        Container(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Beneficiário(a)',
                                style: TextStyle(fontSize: 14)),
                            Container(height: 5),
                            Text(user?.patient?.name ?? "",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ],
                    ),
                    Container(height: 20),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(height: 20),
                            const Icon(
                              Icons.calendar_month,
                              color: Colors.indigo,
                            ),
                          ],
                        ),
                        Container(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Horário agendamento:',
                                style: TextStyle(fontSize: 14)),
                            Container(height: 5),
                            Text(
                                new DateFormat("d/MM/y HH:mm")
                                    .format(selectedDateTime!),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ],
                    ),
                    Container(height: 20),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(height: 20),
                            const Icon(
                              Icons.person,
                              color: Colors.indigo,
                            ),
                          ],
                        ),
                        Container(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Profissional:',
                                style: TextStyle(fontSize: 14)),
                            Container(height: 5),
                            Text(doctor?.name ?? "",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Container(height: 5),
                            Text(doctor?.speciality?.name ?? "",
                                style: TextStyle(fontSize: 15))
                          ],
                        ),
                      ],
                    ),
                    Container(height: 30),
                    Container(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            var status = Status(1, 'Agendado', 'shceduled');
                            var observation = "Observation";
                            var medicalAppointment = MedicalAppointment(
                                null,
                                user?.patient,
                                doctor,
                                status,
                                doctor?.speciality,
                                observation,
                                DateTime.now(),
                                selectedDateTime,
                                1);
                            AppointmentService.saveMedicalAppointment(
                                medicalAppointment);
                          },
                          child: Text('SOLICITAR CONSULTA')),
                    )
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
          future: UserService.getCurrentUser(),
        ),
      ),
    );
  }
}
