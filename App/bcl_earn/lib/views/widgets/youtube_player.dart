import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyTube extends StatefulWidget {
  final link;

  const MyTube({Key key, @required this.link}) : super(key: key);

  @override
  _MyTubeState createState() => _MyTubeState();
}

class _MyTubeState extends State<MyTube> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId("${widget.link}"),
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: YoutubePlayer(
            controller: _controller,
            /*progressIndicatorColor: Colors.amber,
            progressColors: ProgressBarColors(
              playedColor: Colors.amber,
              handleColor: Colors.amberAccent,
            ),*/
            showVideoProgressIndicator: false,
            onReady: () {
              _controller.addListener(() {
                //_controller.play();
              });
            },
          ),
        ),
      ],
    );
  }
}
