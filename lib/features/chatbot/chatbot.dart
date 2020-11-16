import 'package:flutter/material.dart';
import 'package:new_edai_project/features/chatbot/dialog_flow.dart';

class Chatbot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health-Bot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.purple,
      ),
      home: FlutterFactsChatBot(),
    );
  }
}
