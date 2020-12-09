import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'exerciseBrain.dart';

ExerciseBrain exerciseBrain = ExerciseBrain();

class ExerciseThird extends StatefulWidget {
  @override
  _ExerciseThirdState createState() => _ExerciseThirdState();
}

class _ExerciseThirdState extends State<ExerciseThird> {
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
            imageName: exerciseBrain.listofExer[0].imageURL,
            exerciseName: exerciseBrain.listofExer[0].exerciseName,
          ),
          ThirdReusableCard(
            imageName: exerciseBrain.listofExer[1].imageURL,
            exerciseName: exerciseBrain.listofExer[1].exerciseName,
          ),
          ThirdReusableCard(
            imageName: exerciseBrain.listofExer[2].imageURL,
            exerciseName: exerciseBrain.listofExer[2].exerciseName,
          ),
          ThirdReusableCard(
            imageName: exerciseBrain.listofExer[3].imageURL,
            exerciseName: exerciseBrain.listofExer[3].exerciseName,
          )
        ],
      ),
    );
  }
}

class ThirdReusableCard extends StatelessWidget {
  ThirdReusableCard({this.imageName, this.exerciseName});
  final String imageName;
  final String exerciseName;
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
                                image: AssetImage(imageName),
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
                  exerciseName,
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
