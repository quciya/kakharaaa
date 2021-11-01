import 'package:flutter/material.dart';
import 'constants.dart';
import 'Components/welcome.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'कखरा',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        
        backgroundColor:Colors.white
      ),
    home:SplashScreen()
    );
  }
}

