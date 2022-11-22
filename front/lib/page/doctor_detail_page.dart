import 'package:flutter/material.dart';
import 'package:front/page/appointment_page.dart';

class DoctorDetailPage extends StatefulWidget {
  const DoctorDetailPage({Key? key}) : super(key: key);

  @override
  State<DoctorDetailPage> createState() => _DoctorDetailPageState();
}

class _DoctorDetailPageState extends State<DoctorDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[Text('Ver Detalhes')])),
        body: Container(
            padding: const EdgeInsets.all(20),
            color: const Color.fromRGBO(224, 215, 215, 0.2),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Container(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Icon(Icons.share)),
                    Container(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: Icon(Icons.favorite))
                  ],
                ),
                Container(height: 10),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(height: 80),
                        Icon(Icons.route),
                        Container(height: 10),
                        Text('ROTAS')
                      ],
                    ),
                    Container(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Leonardo Liporone Baruki',
                          style: TextStyle(color: Colors.indigo, fontSize: 20),
                        ),
                        Container(height: 2),
                        Text(
                          'Luiz Abdala Baruki',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(height: 5),
                        Text('CRM/SP.97266'),
                        Text('Razão Social: CLIN BARUKI SC LTDA'),
                        Container(height: 30),
                        Text('Rua Leoncio De Carvalho, 306')
                      ],
                    )
                  ],
                ),
                Container(height: 35),
                Row(
                  children: [
                    Icon(Icons.video_camera_front),
                    Container(width: 10),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Este profissional de saúde realiza atendimentos por vídeo.'),
                          Text(
                              'Agende pelo telefone ou solicite direto pelo App.'),
                        ],
                      ),
                    )
                  ],
                ),
                Container(height: 50),
                Container(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/request_appointment');
                      },
                      child: Text('SOLICITAR AGENDAMENTO')),
                )
              ],
            )));
  }
}