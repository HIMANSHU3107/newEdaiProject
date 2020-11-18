import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExerciseThird extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0D0620),
        title: Text('Exercise'),
      ),
      // backgroundColor: Color(0xff0D0620),
      body: Column(
        children: [
          ThirdReusableCard(
            imageName: 'assets/images/pushUp.png',
          ),
          ThirdReusableCard(
            imageName: 'assets/images/pushUp.png',
          ),
          ThirdReusableCard(
            imageName: 'assets/images/pushUp.png',
          ),
          ThirdReusableCard(
            imageName: 'assets/images/pushUp.png',
          )
        ],
      ),
    );
  }
}

class ThirdReusableCard extends StatelessWidget {
  ThirdReusableCard({this.imageName});
  final String imageName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          content: Column(
                            children: [
                              Image(
                                image: AssetImage('assets/images/pushUp.png'),
                              ),
                              Text(
                                  'Lay prone on the ground with arms supporting your body. keep your Body straight while raising and owering your body with your arms. The exercise works the chest,shoulders, triceps,back and legs.'),
                              RichText(
                                text: TextSpan(
                                    style: TextStyle(color: Colors.blue),
                                    text: 'click here to see the video',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        var url =
                                            'https://youtu.be/bt5b9x9N0KU';
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          throw 'cannot load url';
                                        }
                                      }),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    child: Icon(Icons.reorder)),
                Image.asset(
                  imageName,
                  fit: BoxFit.fitWidth,
                  height: 100,
                  width: 100,
                ),
                Text(
                  'PushUps',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}