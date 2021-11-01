import 'dart:math';
import 'dart:ui';
import 'classdefs/Letter.dart';
import 'Lesson1Singleton.dart';
import 'package:flutter/material.dart';

//Fix:global variables
Offset handlePosition = Offset(0, 0);
Offset userTouched = Offset(0, 0);
double dragSlope = 0.0;

class LetterGuidePage extends StatefulWidget {
  final Letter letterToProcess;
  LetterGuidePage({Key key, this.letterToProcess}) : super(key: key);
  @override
  _LetterGuidePageState createState() => _LetterGuidePageState();
}

class _LetterGuidePageState extends State<LetterGuidePage> {
  int activeTask = 0;
  @override
  void dispose() {
    appData.taskComplete = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          height: 400,
          width: 400,
          child: GestureDetector(
            onPanStart: (details) {
              setState(() {
                userTouched = details.localPosition;
              });
            },
            onPanUpdate: (details) {
              setState(() {
                userTouched = details.localPosition;
                // dragSlope = details.delta.direction; //can be an alternative
                dragSlope = atan2(details.delta.dx, details.delta.dy);
              });
            },
            onPanEnd: (details) {
              setState(() {});
            },
            child: CustomPaint(
              painter: LetterPainter(
                  direction: dragSlope, activeLetter: widget.letterToProcess),
            ),
          ),
        ),
      ),
    );
  }
}

//FIX: Make it more dynamic and modern
int currentStrokeLength;
int currentLetterLength;
double _t = 0.01;
Offset guidePoint = Offset(0, 0);

int activeCurve = 0;
int activeStroke = 0;

class LetterPainter extends CustomPainter {
  double direction = 0.0;

  final Letter activeLetter;
  LetterPainter({this.direction, @required this.activeLetter});
  static final List<Offset> progressCurve = [Offset(-1000, -1000)];

  @override
  void paint(Canvas canvas, Size size) {
    currentStrokeLength = activeLetter.strokes[activeStroke].stroke.length - 1;
    currentLetterLength = activeLetter.strokes.length - 1;
    // print(currentStrokeLength);
    // print(currentLetterLength);

    Paint ghostBrush = Paint()
      ..color = Color(0xFFe8e8e8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 32.0
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round;

    Paint drawingBrush = Paint()
      ..color = Colors.black
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
    Paint handlePaint = Paint()
      ..color = Colors.greenAccent[400]
      ..style = PaintingStyle.fill;

    //Strokes
    void drawPointArray(Letter letterToDraw) {
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

    double curveTan = getTangent(
        activeLetter.strokes[activeStroke].stroke[activeCurve].curve, _t);

    if ((direction < (curveTan + 0.78)) && (direction > (curveTan - 0.78))) {
      _t = _t + 0.07;
    }
    if (_t >= 1) {
      // this signifies current active curve is over
      _t = 1.0;
      List<Offset> subCurve = genSubCurvePoints(
          activeLetter.strokes[activeStroke].stroke[activeCurve].curve, _t);

      progressCurve.addAll(subCurve); //add total progress

      canvas.drawPoints(PointMode.points, subCurve, drawingBrush);
      _t = 0.01;

      if ((activeStroke == currentLetterLength) &&
          ((activeCurve == currentStrokeLength))) {
        appData.taskComplete = true; // This changes the task completion switch
      }
      if (activeCurve < currentStrokeLength) {
        activeCurve++;
      }
      if (activeStroke < currentLetterLength) {
        activeStroke++;
      }
      //completion

    }
    List<Offset> subCurve = genSubCurvePoints(
        activeLetter.strokes[activeStroke].stroke[activeCurve].curve, _t);

    drawPointArray(activeLetter);

    canvas.drawPoints(PointMode.points, subCurve, drawingBrush);

    canvas.drawPoints(PointMode.points, progressCurve, drawingBrush);

    guidePoint = subCurve.last;
    if (!appData.taskComplete) {
      canvas.drawCircle(guidePoint, 20, handlePaint);
    } else {}
  }

  @override
  bool shouldRepaint(LetterPainter oldDelegate) => true;
  //FIX: Change this to true during real implementation

  @override
  bool shouldRebuildSemantics(LetterPainter oldDelegate) => true;
}
