import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:jungle_adveture/fetch_story.dart';
import 'package:jungle_adveture/story_controller.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(JungleAdventure());
}

class JungleAdventure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        body: JungleStory(),
      ),
    );
  }
}

class JungleStory extends StatefulWidget {
  @override
  _JungleStoryState createState() => _JungleStoryState();
}

class _JungleStoryState extends State<JungleStory> {
  var myStory = StoryController();

  void checkNextStoryStep(int nextStoryStep) {
    if (nextStoryStep == 0) {
      myStory.clear(); // Bad end
      Alert(
        context: context,
        title: "Your story ends",
        desc: "Try your best next time",
        // image: Image.asset("assets/success.png"),
        style: AlertStyle(
            titleStyle: TextStyle(fontSize: 46, fontFamily: 'Wonderful'),
            descStyle: TextStyle(fontSize: 38, fontFamily: 'Wonderful')),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "OK",
              style: TextStyle(
                  color: Colors.white, fontSize: 36, fontFamily: 'Wonderful'),
            ),
          )
        ],
      ).show();
    } else if (nextStoryStep == 999) {
      myStory.clear(); // Success
      Alert(
        context: context,
        title: "Excelent",
        desc: "Your are realy good hunter",
        style: AlertStyle(
            titleStyle: TextStyle(fontSize: 46, fontFamily: 'Wonderful'),
            descStyle: TextStyle(fontSize: 38, fontFamily: 'Wonderful')),
        // image: Image.asset("assets/success.png"),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "OK",
              style: TextStyle(
                  color: Colors.white, fontSize: 36, fontFamily: 'Wonderful'),
            ),
          )
        ],
      ).show();
    } else {
      myStory.nextStepStory(nextStoryStep);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/back.jpg'), fit: BoxFit.cover)),
      child: !myStory.isFetched
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Hi traveler!\n Are you ready \nto go to the jungle?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontFamily: 'Aladin',
                      shadows: [
                        Shadow(color: Colors.black, offset: Offset(1.5, 1.5))
                      ],
                    ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(8),
                    height: 70,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green)),
                      onPressed: () async {
                        myStory.fromJson(await fetchStory());
                        setState(() {});
                      },
                      child: Text("Yes let's go",
                          style:
                              TextStyle(fontSize: 40, fontFamily: 'Wonderful')),
                    ),
                  ),
                ],
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Center(
                        child: Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    myStory.storyStep.text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'Skranji',
                        shadows: [
                          Shadow(color: Colors.black, offset: Offset(1.5, 1.5))
                        ]),
                  ),
                ))),
                Container(
                  margin: EdgeInsets.all(8),
                  height: 70,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepOrange[900])),
                    onPressed: () {
                      checkNextStoryStep(myStory.storyStep.next1);
                      setState(() {});
                    },
                    child: Text(
                      myStory.storyStep.answer1,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontFamily: 'Zooma'),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  height: 70,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.brown)),
                    onPressed: () {
                      checkNextStoryStep(myStory.storyStep.next2);
                      setState(() {});
                    },
                    child: Text(
                      myStory.storyStep.answer2,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: 'Skranji'),
                    ),
                  ),
                ),
                // FloatingActionButton(

                //     child: Icon(
                //       Icons.arrow_back,
                //       color: Colors.white,
                //     ),
                //     onPressed: () {
                //       setState(() {
                //         myStory.clear();
                //         print('Story cleared');
                //       });
                //     }),
              ],
            ),
    );
  }
}
