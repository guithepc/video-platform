import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/page/details_request_page.dart';
import 'package:intl/intl.dart';

import '../model/available_date.dart';
import '../model/doctor.dart';
import '../service/appointment_service.dart';

class RequestAppointmentPage extends StatefulWidget {
  const RequestAppointmentPage({required this.doctor});
  final Doctor doctor;

  @override
  State<StatefulWidget> createState() => _RequestAppointmentPageState(doctor);
}

class _RequestAppointmentPageState extends State<RequestAppointmentPage> {
  final Doctor doctor;
  _RequestAppointmentPageState(this.doctor);
  TextEditingController controller = TextEditingController();
  List<DateTime> selectableDays = [];
  List<DateTime> selectableHours = [];
  DateTime? dateSelect;
  String appointmentDate = DateTime.now().toString();
  var inputFormat = DateFormat('dd/MM/yyyy HH:mm');

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
          child: FutureBuilder<List<AvailableDate>>(
            builder: (BuildContext context,
                AsyncSnapshot<List<AvailableDate>> snapshot) {
              if (snapshot.hasData) {
                snapshot.data?.forEach((date) {
                  this.selectableDays.add(date.date);
                });
                return ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      color: const Color.fromRGBO(0, 185, 255, 0.2),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.warning_rounded,
                                color: Colors.indigo,
                              ),
                              Container(width: 10),
                              const Text(
                                'FIQUE DE OLHO NO CELULAR',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.indigo),
                              )
                            ],
                          ),
                          Container(height: 20),
                          const Text(
                              'A clínica pode entrar em contato para sugerir outros horários ou passar orientações.')
                        ],
                      ),
                    ),
                    Container(height: 40),
                    const Text(
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
                                  Text('${doctor.startAt} - ${doctor.endAt}'),
                                  Text('${doctor.startAt} - ${doctor.endAt}'),
                                  Text('${doctor.startAt} - ${doctor.endAt}'),
                                  Text('${doctor.startAt} - ${doctor.endAt}'),
                                  Text('${doctor.startAt} - ${doctor.endAt}'),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(height: 10),
                    const Text('Selecione o dia que deseje agendar:',
                        style: TextStyle(fontSize: 20)),
                    Container(height: 10),
                    TextField(
                        autofocus: false,
                        readOnly: true,
                        controller: controller,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.calendar_month),
                          labelText: 'Data do Agendamento',
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: selectableDays[0],
                            firstDate: DateTime(2021),
                            lastDate: DateTime(2023),
                            selectableDayPredicate: (DateTime val) =>
                                selectableDays.contains(val) ? true : false,
                          );
                          if (pickedDate != null) {
                            setState(() {
                              controller.text = pickedDate.toString();
                              snapshot.data?.forEach((date) {
                                if (date.date == pickedDate) {
                                  selectableHours = date.hours;
                                }
                              });
                            });
                          }
                        }),
                    Container(
                      height: 180,
                      child: GridView.builder(
                          itemCount: selectableHours.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 2),
                          itemBuilder: (ctx, index) {
                            return Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    dateSelect = selectableHours[index];
                                    controller.text = dateSelect.toString();
                                  });
                                },
                                child: Text(
                                  new DateFormat("HH:mm")
                                      .format(selectableHours[index]),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            );
                          }),
                    ),
                    Container(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              if (dateSelect != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsRequestPage(
                                        selectedDateTime: dateSelect,
                                        doctor: doctor),
                                  ),
                                );
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Error"),
                                        content: Text(
                                            "Horário do agendamento não foi selecionado!"),
                                        actions: [
                                          ElevatedButton(
                                            child: Text("Ok"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      );
                                    });
                              }
                            },
                            child: Text('CONTINUAR')))
                  ],
                );
              } else {
                return Container();
              }
            },
            future: AppointmentService.availableAppointmentDate(doctor.id ?? 0),
          ),
        ));
  }
}
