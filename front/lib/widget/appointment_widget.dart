import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/page/doctor_detail_page.dart';
import 'package:front/page/video_page.dart';
import 'package:front/service/appointment_service.dart';
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
                new DateFormat("d/MM/y HH:mm").format(entrie.appointmentDate!),
                style: TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      AppointmentService.cancelAppointment(entrie.id!);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Cancelado com sucesso"),
                              content: Text(
                                  "Cancelamento com o Doutor ${entrie.doctor?.name} para o dia ${new DateFormat("d/MM/y HH:mm").format(entrie.appointmentDate!)} foi efetuado com sucesso!"),
                              actions: [
                                ElevatedButton(
                                  child: Text("Ok"),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushReplacementNamed('/home');
                                  },
                                )
                              ],
                            );
                          });
                    },
                    child: Icon(Icons.restore_from_trash),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.memory(
                    base64Decode(entrie.doctor?.profileImage ?? ""),
                    height: 60,
                  )),
              Container(
                width: 5,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  entrie.doctor?.name ?? "",
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
                Container(
                  height: 10,
                ),
                Text(
                  entrie.doctor?.speciality?.name ?? "",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )
              ])
            ],
          ),
          Container(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (DateTime.now().isAfter(entrie.appointmentDate!) &&
                  DateTime.now().isBefore(
                      entrie.appointmentDate!.add(const Duration(minutes: 30))))
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoPage(id: entrie?.id),
                      ),
                    );
                  },
                  child: Text('ACESSAR CONSULTA'),
                )
              else
                Container(),
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
