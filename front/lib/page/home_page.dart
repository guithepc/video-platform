import 'package:flutter/material.dart';
import 'package:front/model/medical_appointment.dart';

import '../app_controller.dart';
import '../widget/appointment_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Text('Suas consultas')])),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed('/appointment');
          },
        ),
        body: Container(
          color: const Color.fromRGBO(224, 215, 215, 0.2),
          width: double.infinity,
          height: double.infinity,
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Olá Arthur, como está se sentindo?',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Suas consultas:',
                style: TextStyle(fontSize: 20),
              ),
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
          ]),
        ));
  }
}

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDartTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
