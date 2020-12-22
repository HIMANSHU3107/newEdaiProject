import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class ModeBody extends StatefulWidget {
  final String assetImage;
  final String audioFile;

  const ModeBody({Key key, this.assetImage, this.audioFile}) : super(key: key);
  @override
  _ModeBodyState createState() => _ModeBodyState();
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

class _ModeBodyState extends State<ModeBody> with TickerProviderStateMixin {
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
    return Expanded(
      child: Stack(
        children: [
          Positioned(
              bottom: 0, right: 0, child: Image.asset(widget.assetImage)),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.2,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 100,
                            child: Image.asset("assets/images/trithin.png"),
                          ),
                          Positioned(
                            top: 55,
                            left: 35,
                            child: Text(
                              "${_position.inSeconds.toDouble()}",
                              style: TextStyle(
                                fontFamily: "Josefin",
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${(_duration.inSeconds.toDouble() / 60).toStringAsFixed(2)}" +
                            " Min",
                        style: TextStyle(
                          fontFamily: "Josefin",
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 18),
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isplaying
                                    ? _animationIconController1.reverse()
                                    : _animationIconController1.forward();
                                isplaying = !isplaying;
                              });
                              if (issongplaying == false) {
                                audioCache.play(widget.audioFile,
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(3),
                                  padding: EdgeInsets.only(bottom: 2),
                                  height: 25,
                                  width: 20,
                                  child: AnimatedIcon(
                                    icon: AnimatedIcons.play_pause,
                                    progress: _animationIconController1,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                ),
                                Text(
                                  "PLAY",
                                  style: TextStyle(
                                    fontFamily: "Josefin",
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 20,
                  width: 20,
                  child: Image.asset("assets/images/clock.png"),
                ),
                Container(
                  height: 20,
                  width: 20,
                  child: Image.asset("assets/images/equalizer.png"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
