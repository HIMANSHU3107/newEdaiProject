import 'package:flutter/material.dart';
import 'package:new_edai_project/features/chatbot/dialog_flow.dart';

class Chatbot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Facts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.green,
      ),
      home: FlutterFactsChatBot(),
    );
  }
}
