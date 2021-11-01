class AppData {
  static final AppData _appData = AppData._internal();

  bool taskComplete = false;

  factory AppData() {
    return _appData;
  }
  AppData._internal();
}

final appData = AppData();
