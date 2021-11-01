import 'package:flutter/foundation.dart';

class LessonStats {
  LessonStats({this.activeTask, this.totalTask});
  @required
  int activeTask;
  @required
  int totalTask;
}