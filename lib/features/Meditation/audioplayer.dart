import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Audioplayer extends StatefulWidget {
  @override
  _AudioplayerState createState() => _AudioplayerState();
}

AnimationController _animationIconController1;

AudioCache audioCache;
AudioPlayer audioPlayer;

Duration _duration = new Duration();
Duration _position = new Duration();

bool issongplaying = false;
bool isplaying = false;
bool playing = false;

void seekToSeconds(int second) {
  Duration newDuration = Duration(seconds: second);
  audioPlayer.seek(newDuration);
}

class _AudioplayerState extends State<Audioplayer>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    initPlayer();
  }

  void initPlayer() {
    _animationIconController1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
      reverseDuration: Duration(milliseconds: 750),
    );
    audioPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() => _duration = d);
    });
    audioPlayer.onAudioPositionChanged.listen((Duration p) => {
          setState(() => _position = p),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AudioPlayer"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
              value: _position.inSeconds.toDouble(),
              max: _duration.inSeconds.toDouble(),
              onChanged: (double value) {
                setState(() {
                  seekToSeconds(value.toInt());
                  value = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${_position.inSeconds.toDouble()}"),
                  Text("${_duration.inSeconds.toDouble()}"),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isplaying
                      ? _animationIconController1.reverse()
                      : _animationIconController1.forward();
                  isplaying = !isplaying;
                });
                if (issongplaying == false) {
                  audioCache.play("https://li.sten.to/AAsswZj",
                      mode: PlayerMode.MEDIA_PLAYER);
                  setState(() {
                    issongplaying = true;
                  });
                } else {
                  audioPlayer.pause();
                  setState(() {
                    issongplaying = false;
                  });
                }
              },
              child: ClipOval(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.5,
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                  ),
                  width: 75,
                  height: 75,
                  child: Center(
                    child: AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: _animationIconController1,
                      color: Colors.grey,
                      size: 60,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
