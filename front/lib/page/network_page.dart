import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/model/doctor.dart';
import 'package:front/model/speciality.dart';

import '../service/doctor_service.dart';
import '../widget/appointment_widget.dart';
import '../model/medical_appointment.dart';
import '../widget/new_appointment_widget.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({required this.speciality});

  final Speciality speciality;

  @override
  State<StatefulWidget> createState() => _NetworkPageState(speciality);
}

class _NetworkPageState extends State<NetworkPage> {
  final Speciality speciality;
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
                    speciality.name,
                    style: TextStyle(fontSize: 30),
                  )
                ],
              ),
              Container(
                height: 20,
              ),
              FutureBuilder(
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Doctor>> snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    } else {
                      List<Doctor> listDoctor = snapshot.data!;
                      return Expanded(
                          child: ListView.builder(
                              itemCount: listDoctor.length,
                              padding: const EdgeInsets.all(0.0),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    width: 300,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                color: Colors.black))),
                                    child: NewAppointmentWidget(
                                        entrie: listDoctor[index]));
                              }));
                    }
                  },
                  future: DoctorService.findDoctorBySpeciality(speciality.id))
              /**/
            ])));
  }
}
