import 'package:flutter/material.dart';
import 'facts_message.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:new_edai_project/features/chatbot/facts_message.dart';
import 'widgets/basicCard.dart';
import 'widgets/carouselSelect.dart';
import 'widgets/simple_message.dart';

class FlutterFactsChatBot extends StatefulWidget {
  FlutterFactsChatBot({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FlutterFactsChatBotState createState() => new _FlutterFactsChatBotState();
}

class _FlutterFactsChatBotState extends State<FlutterFactsChatBot> {
  final List<Facts> messageList = <Facts>[];
  final TextEditingController _textController = new TextEditingController();

  Widget _queryInputWidget(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _submitQuery,
                decoration:
                    InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Color(0xff392850),
                  ),
                  onPressed: () => _submitQuery(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  dynamic getWidgetMessage(message) {
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
            clickItem: (info) {
              print(info); // Item Click print List Keys
            });
      }
    }
    return null;
  }

  void agentResponse(query) async {
    _textController.clear();
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/newedaiproject-9558dabadbe5.json")
            .build();
    Dialogflow dialogFlow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogFlow.detectIntent(query);
    if (response.getMessage() != null && response.getMessage() != "") {
      Facts message = Facts(
        text: response.getMessage() ??
            CardDialogflow(response.getListMessage()[0]).title,
        name: "Flutter",
        type: false,
      );

      setState(() {
        messageList.insert(0, message);
      });
    } else {
      List<dynamic> messages = response.getListMessage();
      for (var i = 0; i < messages.length; i++) {
        dynamic message = getWidgetMessage(messages[i]);
        if (message != null) {
          setState(() {
            messageList.insert(0, message);
          });
        }
      }
    }
  }

  void _submitQuery(String text) {
    _textController.clear();
    Facts message = new Facts(
      text: text,
      name: "Me",
      type: true,
    );
    setState(() {
      messageList.insert(0, message);
    });
    agentResponse(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Health-Bot",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff392850),
        elevation: 15,
      ),
      body: Column(children: <Widget>[
        Flexible(
            child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          reverse: true, //To keep the latest messages at the bottom
          itemBuilder: (_, int index) => messageList[index],
          itemCount: messageList.length,
        )),
        _queryInputWidget(context),
      ]),
    );
  }
}
