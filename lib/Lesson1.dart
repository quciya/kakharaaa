import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'Lesson1Singleton.dart';
import 'LetterGuidePage.dart';
import 'LetterTestPage.dart';
import 'Components/congrats.dart';
import 'classdefs/LessonStats.dart';
import 'Models/Letters.dart';


// Set the number of tasks for this lesson
final currentLesson = LessonStats()
  ..activeTask = 0 // Since it is initialising now, it is 0 now
  ..totalTask = 2; // Total tasks or minigames

class Lesson1 extends StatefulWidget {
  @override
  _Lesson1State createState() => _Lesson1State();
}

class _Lesson1State extends State<Lesson1> {
  final Letter currentLetter = ka;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LessonProgressBar(),
            IndexedStack(
              index: currentLesson.activeTask,
              children: [
                LetterGuidePage(letterToProcess: currentLetter),
                LetterTestPage(
                  letterToProcess: currentLetter
                ),
                
              ],
            ),
            ProceedButton()
          ],
        ),
      ),
    );
  }
}

class LessonProgressBar extends StatefulWidget {
  LessonProgressBar({Key key}) : super(key: key);

  @override
  _LessonProgressState createState() => _LessonProgressState();
}

class _LessonProgressState extends State<LessonProgressBar> {
  // calculates the percent of currentLesson
  double getCurrentPercent() {
    return ((currentLesson.activeTask) / currentLesson.totalTask);
  }

  bool refresh = true;
  @override
  void initState() {
    // Regularly refreshed the screen to update the visibility.
    // Expensive solution because of this but it works for the use case here.
    Future.doWhile(() async {
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 50));
      return refresh;
    });
    super.initState();
  }

  @override
  void dispose() {
    refresh = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 50,
            animation: true,
            lineHeight: 20.0,
            animationDuration: 1000,
            percent: getCurrentPercent(),
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.green,
          ),
        ),
      ),
    );
  }
}

/// ProceedButton widget : This button is only displayed when a task is completed
/// This also facilitates the switching things.
class ProceedButton extends StatefulWidget {
  ProceedButton({Key key}) : super(key: key);

  @override
  _ProceedButtonState createState() => _ProceedButtonState();
}

class _ProceedButtonState extends State<ProceedButton> {
  bool refresh = true;
  @override
  void initState() {
    // Regularly refreshed the screen to update the visibility.
    // Expensive solution because of this but it works for the use case here.
    Future.doWhile(() async {
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 50));
      return refresh;
    });
    super.initState();
  }

  @override
  void dispose() {
    refresh = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Visibility(
        visible: appData.taskComplete,
        child: RaisedButton(
          onPressed: () {
            if (appData.taskComplete) {
              if (currentLesson.activeTask < currentLesson.totalTask - 1) {
                currentLesson.activeTask++;
              } else {
                currentLesson.activeTask = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Congrats()),
                );
              }
              appData.taskComplete = false; //it's like a switch for the button
            }
          }, //onPressed
          color: Colors.lightBlue,
          padding: EdgeInsets.all(12),
          shape: StadiumBorder(),
          child: Text("Check"),
        ),
      ),
    );
  }
}
