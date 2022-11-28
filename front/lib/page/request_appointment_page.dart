import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../model/doctor.dart';

class RequestAppointmentPage extends StatefulWidget {
  const RequestAppointmentPage({required this.entrie});
  final Doctor entrie;

  @override
  State<StatefulWidget> createState() => _RequestAppointmentPageState(entrie);
}

class _RequestAppointmentPageState extends State<RequestAppointmentPage> {
  final Doctor entrie;
  _RequestAppointmentPageState(this.entrie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[Text('Solicitar agendamento')])),
        body: Container(
          padding: const EdgeInsets.all(20),
          color: const Color.fromRGBO(224, 215, 215, 0.2),
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                color: const Color.fromRGBO(0, 185, 255, 0.2),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.warning_rounded,
                          color: Colors.indigo,
                        ),
                        Container(width: 10),
                        Text(
                          'FIQUE DE OLHO NO CELULAR',
                          style: TextStyle(fontSize: 20, color: Colors.indigo),
                        )
                      ],
                    ),
                    Container(height: 20),
                    Text(
                        'A clínica pode entrar em contato par asugerir outros horários ou passar orientações.')
                  ],
                ),
              ),
              Container(height: 40),
              Text(
                'Sua solicitação será para atendimento Teleconsulta',
                style: TextStyle(fontSize: 20),
              ),
              Container(height: 40),
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Horário teleconsulta',
                      style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(height: 15),
                    Row(
                      children: [
                        Column(
                          children: const [
                            Text('Seg'),
                            Text('Ter'),
                            Text('Qua'),
                            Text('Qui'),
                            Text('Sex'),
                          ],
                        ),
                        Container(width: 20),
                        Column(
                          children: [
                            Text('${entrie.startAt} - ${entrie.endAt}'),
                            Text('${entrie.startAt} - ${entrie.endAt}'),
                            Text('${entrie.startAt} - ${entrie.endAt}'),
                            Text('${entrie.startAt} - ${entrie.endAt}'),
                            Text('${entrie.startAt} - ${entrie.endAt}'),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(height: 20),
              const Text('Selecione o dia que deseje agendar:',
                  style: TextStyle(fontSize: 20)),
              Container(height: 20),
              TableCalendar(
                firstDay: DateTime.now(),
                lastDay: DateTime.utc(2022, 12, 30),
                focusedDay: DateTime.now(),
              ),
              Container(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {}, child: Text('CONTINUAR')))
            ],
          ),
        ));
  }
}
