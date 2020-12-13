import 'package:flutter/material.dart';
import '../appbar.dart';
import 'ModeBody.dart';

class SleepMode extends StatelessWidget {
  final List<String> swipeData = ["Sunrise", "Sunset", "Breeze", "Sunlight"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Color(0xff97e37b).withOpacity(0.7),
          child: SafeArea(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Appbar(swipeData),
                  ModeBody(assetImage: "assets/images/coldrop.png"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
