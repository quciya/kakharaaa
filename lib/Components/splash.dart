import 'dart:async';
import 'package:flutter/material.dart' ;
import 'page5.dart';
import'package:flutter_svg/flutter_svg.dart';
class Splash extends StatefulWidget {
   
  State<StatefulWidget> createState() {
    return SplashState();

  }

}
class SplashState extends State<Splash> {
  @override
  void initState() {
    
    super.initState();
   Timer(Duration(seconds: 2),(){
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => FifthPage()
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
          Positioned(
            top: size.height*0.2 ,
            left: size.width*0.4,
            child: SvgPicture.asset("assets/icons/Sun.svg",
            width: size.width * 0.4, ),
          ),
           Positioned (
          top: size.height*0.14,
          left: size.width*0.007,
          child: SvgPicture.asset("assets/icons/Clouds.svg", width: size.width * 0.5)  ,
          ),
         Positioned (
          top: size.height*0.9,
          left: size.width*0.30,
          child: SvgPicture.asset("assets/icons/mascot-grey.svg", width: size.width * 0.4)  ,
          ),
          Positioned (
          top: size.height*0.62,
          left: size.width*0.10,
          child: SvgPicture.asset("assets/icons/suru-garaau.svg", width: size.width * 0.8)  ,
          ),
        ],
       
        
      )
    ));
    
}
}

 