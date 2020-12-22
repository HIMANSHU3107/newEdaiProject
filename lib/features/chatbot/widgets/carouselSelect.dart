import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dialogflow/v2/message.dart';
// import 'package:new_edai_project/features/commonExe.dart';
import 'package:new_edai_project/features/exerciseBrain.dart';
import 'package:new_edai_project/features/exerciseList.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemCarouselWidget extends StatefulWidget {
  final List<ExerciseList> listofExer;
  final int keyValue;
  final ItemCarousel item;
  //final String intentName;
  final bool intentValid;
  final Function clickItem;
  ItemCarouselWidget(
      {Key key,
      this.keyValue,
      this.item,
      this.intentValid,
      this.clickItem,
      this.listofExer})
      : super(key: key);

  @override
  _ItemCarouselWidget createState() => _ItemCarouselWidget();
}

class _ItemCarouselWidget extends State<ItemCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          widget.clickItem(widget.item.info);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          child: new Container(
            margin: EdgeInsets.all(10.0),
            width: 300.0,
            height: 360.0,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.white),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new NetworkImage(widget.item.image.imageUri),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0))),
                  child: null,
                  height: 200.0,
                ),
                new Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        widget.item.title,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      new Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: new Text(widget.item.description),
                      ),
                      SizedBox(height: 20),
                      (widget.intentValid
                          ? Center(
                              child: new FlatButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      content: Column(
                                        children: [
                                          Image(
                                            image: AssetImage(widget
                                                .listofExer[widget.keyValue]
                                                .imageURL),
                                          ),
                                          Text(widget
                                              .listofExer[widget.keyValue]
                                              .aboutExercise),
                                          RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    color: Colors.blue),
                                                text:
                                                    'click here to see the video',
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () async {
                                                        var url = widget
                                                            .listofExer[
                                                                widget.keyValue]
                                                            .youtubeURL;
                                                        if (await canLaunch(
                                                            url)) {
                                                          await launch(url);
                                                        } else {
                                                          throw 'cannot load url';
                                                        }
                                                      }),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                //textColor: Colors.white,
                                padding: const EdgeInsets.all(0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFF1976D2),
                                      style: BorderStyle.solid,
                                      width: 1.0,
                                    ),
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  padding:
                                      const EdgeInsets.fromLTRB(80, 5, 80, 5),
                                  child: const Text('Click Me',
                                      style: TextStyle(
                                        color: Color(0xFF1976D2),
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                      )),
                                ),
                              ),
                            )
                          : SizedBox(height: 5)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class CarouselSelectWidget extends StatefulWidget {
  final ExerciseBrain exerciseBrain = ExerciseBrain();
  CarouselSelectWidget({this.carouselSelect, this.intentName, this.clickItem});

  final Function clickItem;
  final String intentName;
  final CarouselSelect carouselSelect;

  @override
  _CarouselSelectWidget createState() => _CarouselSelectWidget();
}

class _CarouselSelectWidget extends State<CarouselSelectWidget> {
  List<Widget> listItems() {
    List<String> btnIntent = [
      "Abs",
      "Shoulders",
      "Back",
      "Legs",
      "Biceps",
      "Triceps",
      "Chest"
    ];
    bool intentValid = btnIntent.contains(widget.intentName);
    String v = (btnIntent.contains(widget.intentName)) ? 'True' : 'False';
    debugPrint(v);

    var intentNo = 0;
    for (var i = 0; i < 7; i++) {
      if (btnIntent[i] == widget.intentName) {
        intentNo = i + 1;
        break;
      }
    }

    List<Widget> items = [];
    for (var i = 0; i < widget.carouselSelect.items.length; i++) {
      items.add(new ItemCarouselWidget(
        keyValue: i,
        item: widget.carouselSelect.items[i],
        intentValid: intentValid,
        clickItem: widget.clickItem,
        listofExer: widget.exerciseBrain.listofExer[intentNo],
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: listItems()),
      ),
    );
  }
}
