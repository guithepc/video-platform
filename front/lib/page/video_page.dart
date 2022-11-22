import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

const appId = "cf96c1d0fddf475a8d0e19c8257f6c12";
const token =
    "007eJxTYNh7kPOt/tePN2MMrBm/8kTMcE+QYv/Mka+eF3cq8+qCc+IKDMlplmbJhikGaSkpaSbmpokWKQaphpbJFkam5mlACaO04urkhkBGhkMJOxgYoRDE52Ioy0xJzY9PzkgsYWAAAPjUIZI=";

class VideoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late int _remoteUid = 0;
  late RtcEngine _engine;

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
          //_remoteUid = null;
        });
      },
    ));

    VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
    configuration.dimensions = VideoDimensions(width: 1920, height: 1080);

    await _engine.setVideoEncoderConfiguration(configuration);
    await _engine.joinChannel(token, 'video_chat', null, 0);
  }

  _renderLocalPreview() {
    return RtcLocalView.SurfaceView();
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
}
