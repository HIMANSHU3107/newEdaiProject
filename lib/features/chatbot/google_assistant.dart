import 'widgets/basicCard.dart';
import 'widgets/carouselSelect.dart';
import 'widgets/simple_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

class GoogleAssistant extends StatefulWidget {
  GoogleAssistant({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GoogleAssistant createState() => new _GoogleAssistant();
}

class _GoogleAssistant extends State<GoogleAssistant> {
  final List<dynamic> _messages = <dynamic>[];
  final TextEditingController _textController = new TextEditingController();
  BuildContext buildContext;
  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(
                    Icons.send,
                    color: Color(0xff392850),
                  ),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  dynamic getWidgetMessage(message, intentName) {
    TypeMessage ms = TypeMessage(message);
    if (ms.platform == "ACTIONS_ON_GOOGLE") {
      if (ms.type == "simpleResponses") {
        return SimpleMessage(
          text: message['simpleResponses']['simpleResponses'][0]
              ['textToSpeech'],
          name: "Bot",
          type: false,
        );
      }
      if (ms.type == "basicCard") {
        return BasicCardWidget(card: BasicCardDialogflow(message));
      }
      if (ms.type == "carouselSelect") {
        return CarouselSelectWidget(
            carouselSelect: CarouselSelect(message),
            intentName: intentName,
            clickItem: (info) {
              print(info); // Item Click print List Keys
            });
      }
    }
    return null;
  }

  void response(query) async {
    _textController.clear();
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/newedaiproject-9558dabadbe5.json")
            .build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogflow.detectIntent(query);

    String intentName = response.queryResult.intent.displayName;
    debugPrint('intentName is : ' + intentName);

    if (response.getMessage() != null && response.getMessage() != "") {
      SimpleMessage message = new SimpleMessage(
        text: response.getMessage(),
        name: "Bot",
        type: false,
      );
      setState(() {
        _messages.insert(0, message);
      });
    } else {
      List<dynamic> messages = response.getListMessage();
      for (var i = 0; i < messages.length; i++) {
        dynamic message = getWidgetMessage(messages[i], intentName);
        if (message != null) {
          setState(() {
            _messages.insert(0, message);
          });
        }
      }
    }
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    SimpleMessage message = new SimpleMessage(
      text: text,
      name: "Rances",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    response(text);
  }

  @override
  Widget build(BuildContext context) {
    this.buildContext = context;
    Widget tagList = Container(
      color: Colors.transparent,
      height: 50.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              ActionChip(
                label: Text('Hi!',
                    style: TextStyle(
                      color: Color(0xFF1976D2),
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      letterSpacing: 1,
                    )),
                elevation: 6,
                onPressed: () {
                  _handleSubmitted('Hi');
                },
                backgroundColor: Colors.transparent,
                shape: StadiumBorder(
                  side: BorderSide(
                    width: 2,
                    color: Color(0xFF1976D2),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              ActionChip(
                elevation: 6,
                label: Text('Calculate BMI',
                    style: TextStyle(
                      color: Color(0xFF1976D2),
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      letterSpacing: 1,
                    )),
                onPressed: () {
                  _handleSubmitted('Calculate BMI');
                },
                backgroundColor: Colors.transparent,
                shape: StadiumBorder(
                  side: BorderSide(
                    width: 2,
                    color: Color(0xFF1976D2),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              ActionChip(
                elevation: 6,
                label: Text('BreakFast',
                    style: TextStyle(
                      color: Color(0xFF1976D2),
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      letterSpacing: 1,
                    )),
                onPressed: () {
                  _handleSubmitted('BreakFast');
                },
                backgroundColor: Colors.transparent,
                shape: StadiumBorder(
                  side: BorderSide(
                    width: 2,
                    color: Color(0xFF1976D2),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              ActionChip(
                elevation: 6,
                label: Text('Shoulders Workout',
                    style: TextStyle(
                      color: Color(0xFF1976D2),
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      letterSpacing: 1,
                    )),
                onPressed: () {
                  _handleSubmitted('Shoulders Workout');
                  // update board with selection
                },
                backgroundColor: Colors.transparent,
                shape: StadiumBorder(
                  side: BorderSide(
                    width: 2,
                    color: Color(0xFF1976D2),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              ActionChip(
                elevation: 6,
                label: Text('Abs',
                    style: TextStyle(
                      color: Color(0xFF1976D2),
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    )),
                onPressed: () {
                  _handleSubmitted('Abs Workout');
                  // update board with selection
                },
                backgroundColor: Colors.transparent,
                shape: StadiumBorder(
                  side: BorderSide(
                    width: 2,
                    color: Color(0xFF1976D2),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              ActionChip(
                elevation: 6,
                label: Text('High Protein Foods',
                    style: TextStyle(
                      color: Color(0xFF1976D2),
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    )),
                onPressed: () {
                  _handleSubmitted('High Protein Foods');
                },
                backgroundColor: Colors.transparent,
                shape: StadiumBorder(
                  side: BorderSide(
                    width: 2,
                    color: Color(0xFF1976D2),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              ActionChip(
                label: Text('Schedule Personal Trainer',
                    style: TextStyle(
                      color: Color(0xFF1976D2),
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    )),
                onPressed: () {
                  _handleSubmitted('Schedule a Personal Trainer');
                },
                backgroundColor: Colors.transparent,
                shape: StadiumBorder(
                  side: BorderSide(
                    width: 2,
                    color: Color(0xFF1976D2),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          )
        ],
      ),
    );

    return new Scaffold(
      backgroundColor: Color(0xf4f4f4f4f4),
      appBar: new AppBar(
        title: Center(child: new Text("Fitness-Bot")),
        backgroundColor: Color(0xff392850),
        elevation: 15,
      ),
      body: new Column(children: <Widget>[
        new Flexible(
            child: new ListView.builder(
          padding: new EdgeInsets.all(8.0),
          reverse: true,
          itemBuilder: (_, int index) => _messages[index],
          itemCount: _messages.length,
        )),
        new Divider(height: 1.0),
        tagList,
        new Container(
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          child: _buildTextComposer(),
        ),
      ]),
    );
  }
}
