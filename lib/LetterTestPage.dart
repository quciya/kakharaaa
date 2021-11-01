///This package gives us a canvas to draw and extracts the image of canvas to
///memory

import 'dart:ui';
import 'package:flutter/material.dart';
import 'Lesson1Singleton.dart';
import 'Models/Letters.dart';

Letter activeLetter = ka;

class LetterTestPage extends StatefulWidget {
  final Letter letterToProcess;
  LetterTestPage({Key key, this.letterToProcess}) : super(key: key);
  @override
  _LetterTestPageState createState() => _LetterTestPageState();
}

class _LetterTestPageState extends State<LetterTestPage> {
  List<Offset> penPoints = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final double width = MediaQuery.of(context).size.width;
    // final double height = MediaQuery.of(context).size.height;// for reference

    return Container(
      child: Center(
        child: Stack(
          children: <Widget>[
            Container(
              child: CustomPaint(
                painter: LetterPainter(activeLetter: widget.letterToProcess),
              ),
            ),
            Container(
              // width: width * 0.8,
              // height: height * 0.8,
              width: 400,
              height: 400,
              //NOTE: For now a fixed canvas will be better to do image processing later on
              child: GestureDetector(
                onPanDown: (details) {
                  setState(() {
                    //NOTE:"LocalPosition" not global
                    appData.taskComplete = true;
                    penPoints.add(details.localPosition);
                  });
                },
                onPanUpdate: (details) {
                  setState(() {
                    penPoints.add(details.localPosition);
                  });
                },
                onPanEnd: (details) {
                  this.setState(() {
                    penPoints.add(null);
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: CustomPaint(
                    painter: ChildSlatePainter(slatePenPoints: penPoints),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Think this as literally a slate where child sketches.
///
///This Painter will  Paint the Canvas(Slate) itself and the Pen (Determined
/// by the gesture of the  child).
class ChildSlatePainter extends CustomPainter {
  List<Offset> slatePenPoints;
  List<Offset> hitPoints;
  ChildSlatePainter({this.slatePenPoints});

  @override
  void paint(Canvas canvas, Size size) {
    //NOTE: These can be replaced by the Alphabet that we are going to use

    Paint penPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 32.0
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < slatePenPoints.length - 1; i++) {
      if (slatePenPoints[i] != null && slatePenPoints[i + 1] != null) {
        canvas.drawLine(slatePenPoints[i], slatePenPoints[i + 1], penPaint);
      } else if (slatePenPoints[i] != null && slatePenPoints[i + 1] == null) {
        canvas.drawPoints(PointMode.points, [slatePenPoints[i]], penPaint);
      }
    }
  }

  @override
  bool shouldRepaint(ChildSlatePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(ChildSlatePainter oldDelegate) => false;
}

//FIX: Make it more dynamic and modern
int currentStrokeLength;
int currentLetterLength;
int activeCurve = 0;
int activeStroke = 0;

class LetterPainter extends CustomPainter {
  double direction = 0.0;
  Letter activeLetter;
  LetterPainter({this.direction, this.activeLetter});
  static final List<Offset> progressCurve = [Offset(-1000, -1000)];

  @override
  void paint(Canvas canvas, Size size) {
    currentStrokeLength = activeLetter.strokes[activeStroke].stroke.length - 1;
    currentLetterLength = activeLetter.strokes.length - 1;
    // currentStrokeLength = 3;
    // currentLetterLength = 1;

    Paint ghostBrush = Paint()
      ..color = Color(0xFFe7e7e7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 32.0
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round;
    Paint testBrush = Paint()
      ..color = Colors.lightBlueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.square;

    //Strokes
    void drawPointArray(Letter letterToDraw)  {
      for (var i = 0; i < letterToDraw.strokes.length; i++) {
        for (var j = 0; j < letterToDraw.strokes[i].stroke.length; j++) {
          List<Offset> curvePoints =
              genPoints(letterToDraw.strokes[i].stroke[j].curve);
          List<Offset> curveDashPoints =
              genPoints(letterToDraw.strokes[i].stroke[j].curve);
          canvas.drawPoints(PointMode.points, curvePoints, ghostBrush);
          canvas.drawPoints(PointMode.lines, curveDashPoints, testBrush);
        }
      }
    }

    drawPointArray(activeLetter);
  }

  @override
  bool shouldRepaint(LetterPainter oldDelegate) => false;
  //FIX: Change this to true during real implementation

  @override
  bool shouldRebuildSemantics(LetterPainter oldDelegate) => false;
}
