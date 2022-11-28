import 'package:flutter/material.dart';
import 'package:front/model/medical_appointment.dart';
import 'package:front/service/appointment_service.dart';

import '../app_controller.dart';
import '../widget/appointment_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late List<MedicalAppointment> entries = <MedicalAppointment>[];

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
            FutureBuilder<List<MedicalAppointment>>(
              builder: (BuildContext context,
                  AsyncSnapshot<List<MedicalAppointment>> snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                } else {
                  entries = snapshot.data!;
                  return Expanded(
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
                                        right:
                                            BorderSide(color: Colors.black))),
                                child:
                                    AppointmentWidget(entrie: entries[index]));
                          }));
                }
              },
              future: AppointmentService.findAllByUserId(),
            )
            /**/
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
