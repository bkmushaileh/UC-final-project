import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/text/app_large_text.dart';
import 'package:flutter_application_1/widgets/text/app_text.dart';

class Music extends StatefulWidget {
  const Music({super.key});

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  final player = AudioPlayer();
  bool isPlay1 = false;
  bool isPlay2 = false;
  bool isPlay3 = false;

  late Duration currentPostion = Duration(seconds: 0);
  late Duration musicLength = Duration(seconds: 0);
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              child: AppLargeText(text: "Relax Playlist")),
          SizedBox(
            height: 10,
          ),
          Container(
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.topLeft,
              child: AppText(text: "Choose what you want to listen today.")),
          SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0), //or 15.0
            child: Container(
              height: 300.0,
              width: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/music/musicimg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              child: AppText(
            text: "Forest Sounds",
            color: Color.fromARGB(255, 242, 104, 104),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  if (currentPostion.inSeconds == 0 ||
                      currentPostion.inSeconds < 10) {
                    seekTo(0);
                  } else if (currentPostion.inSeconds > 10) {
                    seekTo(currentPostion.inSeconds - 10);
                  }
                },
                icon: Icon(Icons.first_page),
                iconSize: 30,
              ),
              IconButton(
                onPressed: () {
                  if (isPlay1) {
                    setState(() {
                      isPlay1 = false;
                    });
                    stopMusic();
                  } else {
                    setState(() {
                      isPlay1 = true;
                    });
                    playMusic();
                  }
                },
                icon: isPlay1 ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                iconSize: 30,
                color: Color.fromARGB(255, 242, 104, 104),
              ),
              IconButton(
                onPressed: () {
                  if (currentPostion > musicLength - Duration(seconds: 10)) {
                    seekTo(currentPostion.inSeconds + 10);
                  } else {
                    seekTo(musicLength.inSeconds);
                    setState(() {
                      isPlay1 = false;
                    });
                    player.stop();
                  }
                },
                icon: Icon(Icons.last_page),
                iconSize: 30,
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
              child: AppText(
            text: "Waves Sounds",
            color: Color.fromARGB(255, 242, 104, 104),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  if (currentPostion.inSeconds == 0 ||
                      currentPostion.inSeconds < 10) {
                    seekTo(0);
                  } else if (currentPostion.inSeconds > 10) {
                    seekTo(currentPostion.inSeconds - 10);
                  }
                },
                icon: Icon(Icons.first_page),
                iconSize: 30,
              ),
              IconButton(
                onPressed: () {
                  if (isPlay2) {
                    setState(() {
                      isPlay2 = false;
                    });
                    stopMusic();
                  } else {
                    setState(() {
                      isPlay2 = true;
                    });
                    player.play(AssetSource("music/ocean.mp3"));
                  }
                },
                icon: isPlay2 ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                iconSize: 30,
                color: Color.fromARGB(255, 242, 104, 104),
              ),
              IconButton(
                onPressed: () {
                  if (currentPostion > musicLength - Duration(seconds: 10)) {
                    seekTo(currentPostion.inSeconds + 10);
                  } else {
                    seekTo(musicLength.inSeconds);
                    setState(() {
                      isPlay2 = false;
                    });
                    player.stop();
                  }
                },
                icon: Icon(Icons.last_page),
                iconSize: 30,
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
              child: AppText(
            text: "Birds Sounds",
            color: Color.fromARGB(255, 242, 104, 104),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  if (currentPostion.inSeconds == 0 ||
                      currentPostion.inSeconds < 10) {
                    seekTo(0);
                  } else if (currentPostion.inSeconds > 10) {
                    seekTo(currentPostion.inSeconds - 10);
                  }
                },
                icon: Icon(Icons.first_page),
                iconSize: 30,
              ),
              IconButton(
                onPressed: () {
                  if (isPlay3) {
                    setState(() {
                      isPlay3 = false;
                    });
                    stopMusic();
                  } else {
                    setState(() {
                      isPlay3 = true;
                    });
                    player.play(AssetSource("music/birds.mp3"));
                  }
                },
                icon: isPlay3 ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                iconSize: 30,
                color: Color.fromARGB(255, 242, 104, 104),
              ),
              IconButton(
                onPressed: () {
                  if (currentPostion > musicLength - Duration(seconds: 10)) {
                    seekTo(currentPostion.inSeconds + 10);
                  } else {
                    seekTo(musicLength.inSeconds);
                    setState(() {
                      isPlay3 = false;
                    });
                    player.stop();
                  }
                },
                icon: Icon(Icons.last_page),
                iconSize: 30,
              ),
            ],
          )
        ],
      ),
    );
  }

  playMusic() {
    player.play(AssetSource("music/forest.mp3"));
  }

  stopMusic() {
    player.pause();
  }

  setup() {
    player.onPositionChanged.listen((d) {
      setState(() {
        currentPostion = d;
      });
      player.onDurationChanged.listen((d) {
        setState(() {
          musicLength = d;
        });
      });
    });
  }

  seekTo(int sec) {
    player.seek(Duration(seconds: sec));
  }
}


//Create Audio player

