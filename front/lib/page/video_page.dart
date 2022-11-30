import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/service/appointment_service.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

const appId = "a847cfd7b1f84e358a1f7278214b9cb6";
const token =
    "007eJxTYFi2I/Lid8UL/yZxH32xnq1sicW2NRcN53KGVJnkfzV4cShfgSE5zdIs2TDFIC0lJc3E3DTRIsUg1dAy2cLI1DwNKGEUv6YtuSGQkWGmnT0rIwMEgvhcDGWZKan58ckZiSUMDADbgyO7";

class VideoPage extends StatefulWidget {
  const VideoPage({required this.id});
  final int? id;
  @override
  State<StatefulWidget> createState() => _VideoPageState(id);
}

class _VideoPageState extends State<VideoPage> {
  final int? id;
  _VideoPageState(this.id);

  int _remoteUid = 0;
  late RtcEngine _engine;
  var muted = false;

  @override
  void initState() {
    super.initState();
    initForAgora();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[Text('Video Call')])),
        body: Stack(
          children: [
            Center(
              child: _renderRemoteVideo(),
            ),
            _toolbar(),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 150,
                height: 150,
                child: Center(child: _renderLocalPreview()),
              ),
            )
          ],
        ));
  }

  Future<void> initForAgora() async {
    await [Permission.microphone, Permission.camera].request();

    _engine = await RtcEngine.create(appId);

    await _engine.enableVideo();

    _engine.setEventHandler(RtcEngineEventHandler(
      joinChannelSuccess: (String channel, int uid, int elapsed) {
        print('local user $uid joined');
      },
      userJoined: (int uid, int elapsed) {
        print('remote user $uid joined');
        setState(() {
          _remoteUid = uid;
        });
      },
      userOffline: (int uid, UserOfflineReason reason) {
        print('remote user $uid left channel');
        setState(() {
          _remoteUid = 0;
        });
      },
    ));

    /*VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
    configuration.dimensions = const VideoDimensions(width: 1920, height: 1080);

    await _engine.setVideoEncoderConfiguration(configuration);*/
    await _engine.joinChannel(token, 'video_chat', null, 0);
    await _engine.switchCamera();
  }

  _renderLocalPreview() {
    return const RtcLocalView.SurfaceView();
  }

  _renderRemoteVideo() {
    if (_remoteUid != 0) {
      return RtcRemoteView.SurfaceView(
        uid: _remoteUid,
        channelId: 'video_chat',
      );
    } else {
      return Text('Por favor espere o usuário remoto logar',
          textAlign: TextAlign.center);
    }
  }

  _toolbar() {
    return Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RawMaterialButton(
              onPressed: () {
                setState(() {
                  muted = !muted;
                });
                _engine.muteLocalAudioStream(muted);
              },
              child: Icon(muted ? Icons.mic_off : Icons.mic,
                  color: muted ? Colors.white : Colors.blueAccent, size: 20.0),
              shape: const CircleBorder(),
              elevation: 2.0,
              fillColor: muted ? Colors.blueAccent : Colors.white,
              padding: const EdgeInsets.all(12.0),
            ),
            RawMaterialButton(
              onPressed: () {
                _engine.leaveChannel();
                _engine.destroy();
                AppointmentService.finish(id!);
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.call_end,
                color: Colors.white,
                size: 35.0,
              ),
              shape: const CircleBorder(),
              elevation: 2.0,
              fillColor: Colors.redAccent,
              padding: const EdgeInsets.all(15.0),
            ),
            RawMaterialButton(
                onPressed: () {
                  _engine.switchCamera();
                },
                child: const Icon(
                  Icons.switch_camera,
                  color: Colors.blueAccent,
                  size: 20.0,
                ),
                shape: const CircleBorder(),
                elevation: 2.0,
                fillColor: Colors.white,
                padding: const EdgeInsets.all(12.0))
          ],
        ));
  }
}
