import 'package:flutter/material.dart';
import 'package:new_edai_project/features/exerciseBrain.dart';
//import 'package:new_edai_project/features/exerciseThird.dart';

// import 'package:new_edai_project/features/audioplayer.dart';

class Yoga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0D0620),
        title: Text('YOGA'),
      ),
      backgroundColor: Color(0xff34495E),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ReusableCard(
              image: 'assets/images/urdhva-Hastansana.gif',
              cardName: 'Urdhva Hastansana',
              number: 0,
            ),
            ReusableCard(
              image: 'assets/images/uttanasana.gif',
              cardName: 'Uttanasana',
              number: 1,
            ),
            ReusableCard(
              image: 'assets/images/Malasana.gif',
              cardName: 'Malasana',
              number: 2,
            ),
            ReusableCard(
              image: 'assets/images/LungeYoga.gif',
              cardName: 'Lunge',
              number: 3,
            ),
            ReusableCard(
              image: 'assets/images/yogaPlank.webp',
              cardName: 'Plank',
              number: 4,
            ),
            ReusableCard(
              image: 'assets/images/Dandasana.webp',
              cardName: 'Dandasana',
              number: 5,
            ),
            ReusableCard(
              image: 'assets/images/Paschimottanasana.webp',
              cardName: 'Paschimottanasana',
              number: 6,
            ),
            ReusableCard(
              image: 'assets/images/JanuSirsasana.webp',
              cardName: 'Janu Sirsasana',
              number: 7,
            ),
            ReusableCard(
              image: 'assets/images/AnandaBalasana.webp',
              cardName: 'Ananda Balasana',
              number: 8,
            ),
          ],
        ),
        // alignment: Alignment.center,
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final ExerciseBrain exerciseBrain = ExerciseBrain();
  ReusableCard({this.image, this.cardName, this.number});

  final String image;
  final String cardName;
  final int number;

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
                height: 300,
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
        ],
      ),
    );
  }
}
