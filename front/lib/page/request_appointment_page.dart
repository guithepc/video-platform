import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestAppointmentPage extends StatefulWidget {
  const RequestAppointmentPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RequestAppointmentPageState();
}

class _RequestAppointmentPageState extends State<RequestAppointmentPage> {
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
          child: Column(
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
                          children: [
                            Text('Seg'),
                            Text('Ter'),
                            Text('Qua'),
                            Text('Qui'),
                            Text('Sex'),
                          ],
                        ),
                        Column(
                          children: [
                            Text('14:30 - 17:00'),
                            Text('12:10 - 18:00'),
                            Text('10:00 - 16:00'),
                            Text('08:00 - 13:00'),
                            Text('07:00 - 12:00'),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
