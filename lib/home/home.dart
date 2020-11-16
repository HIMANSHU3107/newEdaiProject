import 'package:new_edai_project/features/chatbot/chatbot.dart';
import 'package:new_edai_project/features/excercise.dart';
import 'package:new_edai_project/features/Meditation/meditation.dart';
import 'package:flutter/material.dart';
import 'package:new_edai_project/setup/user.dart';
import 'package:kommunicate_flutter_plugin/kommunicate_flutter_plugin.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  final String APP_ID = 'ed0626d303d5d2e5074d2cc4e092cd19';

  void buildConversation() {
    dynamic conversationObject = {'appId': APP_ID};

    KommunicateFlutterPlugin.buildConversation(conversationObject)
        .then((result) {
      // print("Conversation builder success : " + result.toString());
    }).catchError((error) {
      //print("Conversation builder error occurred : " + error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff392850),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ))
          ],
          backgroundColor: Color(0xff392850),
          title: Text('Health Fitness'),
          elevation: 20,
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Exercise(),
              )),
              child: SizedBox(
                height: 80,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: new EdgeInsets.symmetric(horizontal: 10),
                  elevation: 10,
                  color: Color(0xff453658),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 60, top: 10),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: AssetImage('assets/images/exercise.png'),
                              height: 60,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 28, left: 230),
                        child: Text('Exercise',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Meditation(),
              )),
              child: SizedBox(
                height: 80,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: new EdgeInsets.symmetric(horizontal: 10),
                  elevation: 24,
                  color: Color(0xff453658),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 60, top: 10),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: AssetImage('assets/images/meditation.png'),
                              height: 60,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 28, left: 230),
                        child: Text('Meditation',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              /*onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Chatbot(),
              )),*/
              onTap: () => {buildConversation()},
              child: SizedBox(
                height: 80,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: new EdgeInsets.symmetric(horizontal: 10),
                  elevation: 24,
                  color: Color(0xff453658),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 60, top: 10),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image:
                                  AssetImage('assets/images/chatbot-icon.jpg'),
                              height: 60,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 28, left: 230),
                        child: Text('Chat-Bot',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
