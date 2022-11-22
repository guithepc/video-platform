import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/appointment_widget.dart';
import '../model/medical_appointment.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({required this.speciality});

  final String speciality;

  @override
  State<StatefulWidget> createState() => _NetworkPageState(speciality);
}

class _NetworkPageState extends State<NetworkPage> {
  final List<MedicalAppointment> entries = <MedicalAppointment>[
    MedicalAppointment(
        1,
        'Francisco Elton',
        DateTime.parse('2022-07-20 20:18:04Z'),
        200.00,
        'Oftalmologista',
        'Qualquer observação',
        8.5,
        'Avenida Sabará, 1090',
        'Hospital Santa Cruz'),
    MedicalAppointment(
        2,
        'Bruno Carvalho',
        DateTime.parse('2022-04-10 13:38:04Z'),
        240.00,
        'Cardiologista',
        'Duração máxima de 1 hora',
        5.5,
        'Avenida Noronha, 123',
        'Hospital Santa Amelia'),
    MedicalAppointment(
        3,
        'Ligia Ribas Santos',
        DateTime.parse('2022-05-21 17:11:04Z'),
        120.00,
        'Clinco Geral',
        'Qualquer observação qualquer',
        1.5,
        'Avenida Noronha, 123',
        'Hospital Santo Anjo'),
    MedicalAppointment(
        4,
        'Julia Rocha Lima',
        DateTime.parse('2022-01-12 12:32:04Z'),
        300.00,
        'Clinico Geral',
        'Chegar 10 minutos antes',
        0.5,
        'Rua do Sossego, 123',
        'Hospital Pedreira'),
    MedicalAppointment(
        5,
        'Diego Oliveira',
        DateTime.parse('2022-10-01 21:01:04Z'),
        40.00,
        'Dermatologia',
        'Não é possível remarcação',
        5.5,
        'Avenida Yervant, 123',
        'Hospital São João'),
  ];

  final String speciality;

  _NetworkPageState(this.speciality);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[Text('Rede Referenciada')])),
        body: Container(
            color: const Color.fromRGBO(224, 215, 215, 0.2),
            width: double.infinity,
            height: double.infinity,
            child: Column(children: [
              Container(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    speciality,
                    style: TextStyle(fontSize: 30),
                  )
                ],
              ),
              Container(
                height: 20,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: entries.length,
                      padding: const EdgeInsets.all(0.0),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            width: 300,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            decoration: const BoxDecoration(
                                border: Border(
                                    right: BorderSide(color: Colors.black))),
                            child: AppointmentWidget(entrie: entries[index]));
                      })),
            ])));
  }
}
