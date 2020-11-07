import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_edai_project/home/home.dart';
import 'package:new_edai_project/setup/user.dart';
import 'package:new_edai_project/setup/welcome.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User1>(context);

    // return either Home or Authenticate widgit

    if (user == null) {
      return WelcomePage();
    } else {
      return Home();
    }
  }
}
