import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/page/doctor_detail_page.dart';

import '../model/medical_appointment.dart';

class AppointmentWidget extends StatelessWidget {
  const AppointmentWidget({required this.entrie});
  final MedicalAppointment entrie;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 230,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${entrie.distance} KM',
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
                  entrie.doctor,
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
                Container(
                  height: 10,
                ),
                Text(
                  entrie.doctorHospital,
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
          Row(children: [Text(entrie.address)]),
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
                        builder: (context) => const DoctorDetailPage(),
                      ));
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
