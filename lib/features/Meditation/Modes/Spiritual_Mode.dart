import 'package:flutter/material.dart';
import '../appbar.dart';
import 'ModeBody.dart';

class SpiritualMode extends StatelessWidget {
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
          color: Color(0xffffb773).withOpacity(0.7),
          child: SafeArea(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Appbar(swipeData),
                  ModeBody(
                      assetImage: "assets/images/coltri.png",
                      audioFile: "audio/Om.mp3"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
