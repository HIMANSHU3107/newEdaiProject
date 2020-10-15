import 'package:flutter/material.dart';
import 'package:new_edai_project/features/audioplayer.dart';

class Exercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise'),
      ),
      body: Container(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => Audioplayer()));
          },
          child: Text('Audio Player'),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
