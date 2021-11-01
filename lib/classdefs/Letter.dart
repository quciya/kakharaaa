import 'dart:math';
import 'dart:ui';

import 'package:vector_math/vector_math.dart' hide Colors;
import 'package:bezier/bezier.dart';
/// Class representing a [CubicBezier] curve
class LetterCurve {
  LetterCurve({this.curve});
  CubicBezier curve;
}

///Class representing a Stroke containing list of [LetterCurve]
class LetterStroke {
  LetterStroke({this.stroke});
  List<LetterCurve> stroke;
}

/// Class representing the letter contains list of [LetterStroke]
class Letter {
  String name;
  List<LetterStroke> strokes;
  Letter({this.name, this.strokes});
}

///1.Method for creating easy syntax for CubicBezier with 4 points.

CubicBezier genCurve(
  double startx1, //starting point
  double startx2,
  double c1x, //control point 1
  double c1y,
  double c2x, //control point 2
  double c2y,
  double endx1, //end point
  double endx2,
) {
  final curve = CubicBezier([
    Vector2(startx1, startx2),
    Vector2(c1x, c1y),
    Vector2(c2x, c2y),
    Vector2(endx1, endx2)
  ]);
  return curve;
}

///2. Method for generating points.
List<Offset> genPoints(CubicBezier curve) {
  final even = EvenSpacer(curve.positionLookUpTable());
  List<Offset> bezierPoints = [];

  for (var t in even.evenTValues()) {
    Vector2 vectorItem = curve.pointAt(t);
    bezierPoints.add(Offset(vectorItem.x, vectorItem.y));
  }
  return bezierPoints;
}

/// 3.Method for generating even curve Points
List<Offset> genEvenPoints(CubicBezier curve, int stepSize) {
  final even = EvenSpacer(curve.positionLookUpTable());
  List<Offset> bezierPoints = [];
  for (var t in even.evenTValues(parametersCount: stepSize)) {
    Vector2 vectorItem = curve.pointAt(t);
    bezierPoints.add(Offset(vectorItem.x, vectorItem.y));
  }
  return bezierPoints;
}

/// 4. Method for generating left curve
List<Offset> genSubCurvePoints(CubicBezier curve1, double t) {
  //FIX: default value for parameters
  CubicBezier newCurve = curve1.leftSubcurveAt(t);
  List<Offset> newCurvePoint = genPoints(newCurve);
  return newCurvePoint;
}

/// 5. Method for getting the offset value at t
Offset genOffsetAtT(CubicBezier curve, double t) {
  Vector2 vector = curve.pointAt(t);
  return Offset(vector.x, vector.y);
}

///6. Method for getting the tangent angle
double getTangent(CubicBezier curve, double t) {
  Vector2 tangentVector = curve.derivativeAt(t).normalized();
  double slope = atan2(tangentVector[0], tangentVector[1]);
  return slope;
}