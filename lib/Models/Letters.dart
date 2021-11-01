import '../classdefs/Letter.dart';
export '../classdefs/Letter.dart';

  // Create a letter ka.
  final ka = Letter()
    ..name = "ka"
    ..strokes = [
      LetterStroke(stroke: [
        LetterCurve(curve: genCurve(201, 95, 201, 95, 201, 310, 201, 310)),
      ]),
      LetterStroke(stroke: [
        LetterCurve(
            curve: genCurve(
                197.5, 195, 163.199, 143.698, 95.5, 134, 68.8441, 169.268)),
        LetterCurve(
            curve: genCurve(
                68.8441, 169.268, 15.7616, 239.5, 116.699, 327, 198.5, 199)),
        LetterCurve(
            curve:
                genCurve(198.5, 199, 249, 119, 317.929, 152.5, 334.5, 184.5)),
        LetterCurve(
            curve:
                genCurve(334.5, 184.5, 351.071, 216.5, 343, 269.5, 272.5, 275)),
      ])
    ];