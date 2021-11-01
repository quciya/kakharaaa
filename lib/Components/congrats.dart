import 'dart:async';
import 'package:flutter/material.dart' ;
import 'page5.dart';
import'package:flutter_svg/flutter_svg.dart';
class Congrats extends StatefulWidget {
   
  State<StatefulWidget> createState() {
    return SplashState();

  }

}
class SplashState extends State<Congrats> {
  @override
  void initState() {
    
    super.initState();
   Timer(Duration(seconds: 2),(){
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => FifthPage(),
     ),
     );
   });
   
  }
  @override
Widget build(BuildContext context) {
  
       Size size= MediaQuery.of(context).size;
   return Scaffold(
      backgroundColor: Colors.white,
    body: Container(
      height: size.height,
    
      child:Stack(
        alignment: Alignment.center,
        children: <Widget>[
           Positioned (
          top: size.height*0.25 ,
            left: size.width*0.25,
          child: SvgPicture.asset("assets/icons/stars.svg", width: size.width * 0.5)  ,
          ),
         Positioned (
          top: size.height*0.4,
          left: size.width*0.25,
          child: SvgPicture.asset("assets/icons/mascot-congrats.svg", width: size.width * 0.6)  ,
          ),
          Positioned (
          top: size.height*0.73,
          left: size.width*0.32,
          child: SvgPicture.asset("assets/icons/dherai-ramro.svg", width: size.width * 0.4)  ,
          ),
        ],
       
        
      )
    ));
    
}
}

 