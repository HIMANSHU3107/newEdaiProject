import 'package:new_edai_project/setup/sign_in.dart';
import 'package:new_edai_project/setup/sign_up.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff392850),
          title: Text('Health Fitness'),
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Color(0xff392850),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 150,
              ),
              SizedBox(
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    elevation: 20,
                    onPressed: navigateToSignIn,
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 22),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: RaisedButton(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: navigateToSignUp,
                  child: Text(
                    'Sign up',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void navigateToSignIn() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPage(), fullscreenDialog: true));
  }

  void navigateToSignUp() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SignUpPage(), fullscreenDialog: true));
  }
}
