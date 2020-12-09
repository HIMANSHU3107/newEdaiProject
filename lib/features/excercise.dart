import 'package:flutter/material.dart';
import 'package:new_edai_project/features/exerciseThird.dart';

// import 'package:new_edai_project/features/audioplayer.dart';

class Exercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0D0620),
        title: Text('Exercise'),
      ),
      backgroundColor: Color(0xff0D0620),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ReusableCard(
              image: 'assets/images/full_body_exer.jpg',
              cardName: 'Full Body Workout',
            ),
            ReusableCard(
              image: 'assets/images/abs_exer.jpg',
              cardName: 'Abs Workout',
            ),
            ReusableCard(
              image: 'assets/images/shoulder_exer.jpg',
              cardName: 'Shoulders workout',
            ),
            ReusableCard(
              image: 'assets/images/back_exer.jpg',
              cardName: 'Back workout',
            ),
            ReusableCard(
              image: 'assets/images/leg_exer.jpg',
              cardName: 'Legs workout',
            ),
            ReusableCard(
              image: 'assets/images/biceps_exer.jpg',
              cardName: 'Biceps workout',
            ),
            ReusableCard(
              image: 'assets/images/triceps_exer.jpg',
              cardName: 'Triceps workout',
            ),
            ReusableCard(
              image: 'assets/images/chest_exer.jpg',
              cardName: 'Chest workout',
            ),
          ],
        ),
        // alignment: Alignment.center,
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({this.image, this.cardName});

  final String image;
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
              child: Column(
            children: [
              Image.asset(
                image,
                // 'assets/images/full_body_exer.jpg',
                fit: BoxFit.fitWidth,
                height: 200,
                width: double.infinity,
              ),
              Text(
                cardName,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0),
              ),
            ],
          )),
          FlatButton(
            color: Colors.white,
            textColor: Color(0xff392850),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExerciseThird()),
              ); // Perform some action
            },
            child: const Text('START'),
          ),
        ],
      ),
    );
  }
}
