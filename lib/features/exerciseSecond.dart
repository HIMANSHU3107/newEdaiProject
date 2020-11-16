import 'package:flutter/material.dart';

class ExerciseSecond extends StatefulWidget {
  @override
  _ExerciseSecondState createState() => _ExerciseSecondState();
}

class _ExerciseSecondState extends State<ExerciseSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff392850),
        title: Text('Exercise'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xff392850),
          image: new DecorationImage(
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.dstATop),
              image: AssetImage('assets/images/leg_exer.jpg')),
        ),
        // color: Color(0xff392850),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SecondReusableCard(
              exertype: 'Home Workout',
            ),
            SecondReusableCard(
              exertype: 'GYM Workout',
            ),
          ],
        ),
      ),
    );
  }
}

class SecondReusableCard extends StatelessWidget {
  SecondReusableCard({this.exertype});
  final String exertype;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.blueGrey)),
        color: Colors.white,
        height: 60.0,
        minWidth: double.infinity,
        textColor: Color(0xff392850),
        onPressed: () {
          // Perform some action
        },
        child: Text(
          exertype,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
