import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_edai_project/setup/sign_in.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Color(0xff392850),
        ),
        backgroundColor: Color(0xff392850),
        body: Form(
          key: _formKey,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Column(
                children: <Widget>[
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
                    decoration: InputDecoration(
                        labelText: 'Password',
                        fillColor: Colors.white,
                        filled: true),
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
                      elevation: 20,
                      onPressed: signUp,
                      child: Text(
                        'Sign up',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }

  void signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
