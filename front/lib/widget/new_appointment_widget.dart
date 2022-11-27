import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/medical_appointment.dart';

class NewAppointmentWidget extends StatelessWidget {
  const NewAppointmentWidget({required this.entrie});
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
                '25 KM',
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
                  entrie.doctor.doctor.name ?? "",
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
                Container(
                  height: 10,
                ),
                Text(
                  entrie.doctor.doctor.documentNumber ?? "",
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
          Row(children: [Text(entrie.doctor.doctor.crm ?? "")]),
          Container(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {},
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
