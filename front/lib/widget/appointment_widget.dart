import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/page/doctor_detail_page.dart';
import 'package:intl/intl.dart';

import '../model/medical_appointment.dart';

import 'package:intl/date_symbol_data_local.dart';

class AppointmentWidget extends StatelessWidget {
  const AppointmentWidget({required this.entrie});
  final MedicalAppointment entrie;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                new DateFormat("d/MM/y H:m").format(entrie.appointmentDate),
                style: TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.schedule),
                  ),
                ],
              ),
            ],
          ),
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
                  entrie.doctor.name ?? "",
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
                Container(
                  height: 10,
                ),
                Text(
                  entrie.doctor.speciality?.name ?? "",
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
          Row(children: [Flexible(child: Text(entrie.observation ?? "-"))]),
          Container(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/video_call');
                },
                child: Text('ACESSAR CONSULTA'),
              ),
              Container(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DoctorDetailPage(appointment: entrie),
                    ),
                  );
                },
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
