import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_edai_project/home/home.dart';
import 'package:new_edai_project/setup/user.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Color(0xff392850),
        appBar: new AppBar(
          backgroundColor: Color(0xff392850),
        ),
        body: Form(
          key: _formKey,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 60,
                  ),
                  TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Provide an email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'Email',
                        fillColor: Colors.white,
                        filled: true),
                    onSaved: (input) => _email = input,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (input) {
                      if (input.length < 6) {
                        return 'Longer password please';
                      }
                      return null;
                    },
                    style: TextStyle(color: Color(0xff392850)),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onSaved: (input) => _password = input,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonTheme(
                      height: 40,
                      minWidth: 120,
                      buttonColor: Colors.white,
                      child: RaisedButton(
                        onPressed: () {
                          signIn();
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(fontSize: 18),
                        ),
                      )),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                ],
              )),
        ));
  }

  void signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        UserCredential result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        User user = result.user;
        print(user.uid);
        if (user.uid != null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        }
      } catch (e) {
        setState(() {
          error = 'could not sign in with those credentials';
        });
      }
    }
  }
}
