import 'dart:async';
import 'dart:developer';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import './call.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super (key: key);

  @override
  State<StatefulWidget> createState() => IndexState();
}

class IndexState extends State<IndexPage> {
  final _channelController = TextEditingController();
  bool _validateError = false;
  ClientRole? _role = ClientRole.Broadcaster;

  @override
  void dispose() {
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Agora'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 40),
                  Image.network('https://tinyurl.com/2p889y4k'),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _channelController,
                    decoration: InputDecoration(
                        errorText:
                        _validateError ? 'Channel name is mandatory' : null,
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                        hintText: 'Channel name'
                    ),
                  ),
                  RadioListTile(
                    title: const Text('Broadcaster'),
                    onChanged: (ClientRole? value) {
                      setState(() {
                        _role = value;
                      });
                    },
                    value: ClientRole.Broadcaster,
                    groupValue: _role,
                  ),
                  RadioListTile(
                    title: const Text('Audience'),
                    onChanged: (ClientRole? value) {
                      setState(() {
                        _role = value;
                      });
                    },
                    value: ClientRole.Audience,
                    groupValue: _role,
                  ),
                  ElevatedButton(
                    onPressed: onJoin,
                    child: const Text('Join'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 40),
                    ),
                  )
                ],
              )
          ),
        )
    );
  }

  Future<void> onJoin() async {
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      await _handleCameraAndMic(Permission.camera);
      await _handleCameraAndMic(Permission.microphone);
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CallPage(
                channelName: _channelController.text,
                role: _role,
              )
          )
      );
    }
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    log(status.toString());
  }
}
