import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/page/request_appointment_page.dart';

import '../model/doctor.dart';
import '../model/medical_appointment.dart';

class NewAppointmentWidget extends StatelessWidget {
  const NewAppointmentWidget({required this.entrie});
  final Doctor entrie;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(height: 20),
          Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset(
                    'assets/images/medico.png',
                    height: 60,
                  )),
              Container(
                width: 5,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  entrie.name ?? "",
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
                Container(
                  height: 10,
                ),
                Text(
                  entrie.speciality?.name ?? "",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )
              ])
            ],
          ),
          Container(
            height: 10,
          ),
          Row(children: [Text("")]),
          Container(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RequestAppointmentPage(entrie: entrie),
                    ),
                  );
                },
                child: Text('MARCAR CONSULTA'),
              ),
              Container(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'VER DETALHES',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
