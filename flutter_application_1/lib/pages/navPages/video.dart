import 'package:flutter/material.dart';

import 'package:flutter_application_1/widgets/text/app_large_text.dart';
import 'package:flutter_application_1/widgets/text/app_text.dart';
import 'package:video_player/video_player.dart';

class Videos extends StatefulWidget {
  const Videos({super.key});

  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  //intialzie video controller

  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset("video/year.mov")
      ..initialize().then((_) {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20),
              margin: EdgeInsets.only(top: 45),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
                child: AppLargeText(text: "Gym Activities")),
            SizedBox(
              height: 10,
            ),
            Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
                child: AppText(text: "It's been a wonderful year with you!")),
            Container(
              width: 350,
              height: 350,
              child: VideoPlayer(_controller),
            ),
            FloatingActionButton(
                child: Icon(_controller.value.isPlaying
                    ? Icons.pause
                    : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                })
          ],
        ),
      ),
    );
  }
}
