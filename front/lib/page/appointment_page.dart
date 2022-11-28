import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/model/speciality.dart';
import 'package:front/page/network_page.dart';

import '../service/speciality_service.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  TextEditingController controller = TextEditingController();
  late List<Speciality> allSpecialitys = <Speciality>[];
  late List<Speciality> specialitys = <Speciality>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[Text('Consultas e terapias')])),
        body: Container(
          padding: const EdgeInsets.all(10),
          color: const Color.fromRGBO(224, 215, 215, 0.2),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: 170,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Especialidade',
                    ),
                  ),
                ),
                Container(
                  width: 10,
                ),
                SizedBox(
                  width: 170,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Nome do Profissional',
                    ),
                  ),
                )
              ]),
              Container(height: 10),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      controller: controller,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.search),
                        hintText: 'Qual especialidade você quer filtrar?',
                        labelText: 'Especialidade',
                      ),
                      onChanged: searchAppointment,
                    ),
                  ),
                ],
              ),*/
              Container(height: 25),
              FutureBuilder<List<Speciality>>(
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Speciality>> snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    } else {
                      allSpecialitys = snapshot.data!;
                      specialitys = allSpecialitys;
                      return Expanded(
                          child: ListView.builder(
                        itemCount: specialitys.length,
                        itemBuilder: (context, index) {
                          final speciality = specialitys[index];

                          return ListTile(
                            title: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NetworkPage(
                                        speciality: specialitys[index]),
                                  ),
                                );
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white)),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  speciality.name,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          );
                        },
                      ));
                    }
                  },
                  future: SpecialityService.findAllSpeciality())
              /**/
            ],
          ),
        ));
  }

  void searchAppointment(String query) {
    final suggestion = specialitys.where((element) {
      final speciality = element.name.toLowerCase();
      final input = query.toLowerCase();

      return speciality.contains(input);
    }).toList();

    setState(() => specialitys = suggestion);
  }
}
