import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:new_edai_project/features/exerciseBrain.dart';
import 'package:new_edai_project/features/exerciseList.dart';
import 'package:url_launcher/url_launcher.dart';

ExerciseBrain exerciseBrain = ExerciseBrain();

class CommonExe extends StatelessWidget {
  final List<ExerciseList> listofExer;

  CommonExe(this.listofExer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0D0620),
        title: Text('Exercise'),
      ),
      // backgroundColor: Color(0xff0D0620),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ThirdReusableCard(
              imageName: listofExer[0].imageURL,
              exerciseName: listofExer[0].exerciseName,
              aboutImage: listofExer[0].aboutExercise,
              utubeLink: listofExer[0].youtubeURL,
            ),
            ThirdReusableCard(
              imageName: listofExer[1].imageURL,
              exerciseName: listofExer[1].exerciseName,
              aboutImage: listofExer[1].aboutExercise,
              utubeLink: listofExer[1].youtubeURL,
            ),
            ThirdReusableCard(
              imageName: listofExer[2].imageURL,
              exerciseName: listofExer[2].exerciseName,
              aboutImage: listofExer[2].aboutExercise,
              utubeLink: listofExer[2].youtubeURL,
            ),
            ThirdReusableCard(
              imageName: listofExer[3].imageURL,
              exerciseName: listofExer[3].exerciseName,
              aboutImage: listofExer[3].aboutExercise,
              utubeLink: listofExer[3].youtubeURL,
            ),
            ThirdReusableCard(
              imageName: listofExer[4].imageURL,
              exerciseName: listofExer[4].exerciseName,
              aboutImage: listofExer[4].aboutExercise,
              utubeLink: listofExer[4].youtubeURL,
            ),
            ThirdReusableCard(
              imageName: listofExer[5].imageURL,
              exerciseName: listofExer[5].exerciseName,
              aboutImage: listofExer[5].aboutExercise,
              utubeLink: listofExer[5].youtubeURL,
            ),
            ThirdReusableCard(
              imageName: listofExer[6].imageURL,
              exerciseName: listofExer[6].exerciseName,
              aboutImage: listofExer[6].aboutExercise,
              utubeLink: listofExer[6].youtubeURL,
            ),
            // ThirdReusableCard(
            //   imageName: listofExer[4].imageURL,
            //   exerciseName: listofExer[4].exerciseName,
            // ),
            // ThirdReusableCard(
            //   imageName: listofExer[5].imageURL,
            //   exerciseName: listofExer[5].exerciseName,
            // ),
            // ThirdReusableCard(
            //   imageName: listofExer[6].imageURL,
            //   exerciseName: listofExer[6].exerciseName,
            // ),
          ],
        ),
      ),
    );
  }
}

class ThirdReusableCard extends StatelessWidget {
  ThirdReusableCard(
      {this.imageName, this.exerciseName, this.aboutImage, this.utubeLink});
  final String imageName;
  final String exerciseName;
  final String aboutImage;
  final String utubeLink;
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
                              Text(aboutImage),
                              RichText(
                                text: TextSpan(
                                    style: TextStyle(color: Colors.blue),
                                    text: 'click here to see the video',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        var url = utubeLink;
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
