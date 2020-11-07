import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_edai_project/home/home.dart';
import 'package:new_edai_project/setup/user.dart';
import 'package:new_edai_project/setup/welcome.dart';
import 'package:new_edai_project/setup/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User1>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
