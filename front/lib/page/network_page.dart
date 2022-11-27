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
              /*Expanded(
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
                      })),*/
            ])));
  }
}
