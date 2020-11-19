import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SimpleMessage extends StatelessWidget {
  SimpleMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    return <Widget>[
      new Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: new CircleAvatar(
          child: new Image.asset("assets/images/chatbot-icon.png"),
          backgroundColor: Colors.transparent,
          radius: 20,
        ),
      ),
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Card(
              margin: const EdgeInsets.only(top: 5.0),
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: <Widget>[
                  Text(
                    text,
                    style: TextStyle(fontSize: 18),
                  ),
                ]),
              ),
              /*decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                child: new Text(
                  text,
                  style: TextStyle(color: Colors.black),
                ),
              ),*/
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              decoration: BoxDecoration(
                  color: Color(0xff392850),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                child: new Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
      new Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: new CircleAvatar(
          child: new Text(
            'Me',
            style: TextStyle(fontSize: 14),
          ),
          radius: 14,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}
