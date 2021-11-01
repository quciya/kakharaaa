import 'dart:async';
import 'package:flutter/material.dart' ;
import 'page3.dart';
import'package:flutter_svg/flutter_svg.dart';
class SecondPage extends StatefulWidget {
   
  State<StatefulWidget> createState() {
    return SplashState();

  }

}
class SplashState extends State<SecondPage> {
  @override
  void initState() {
    
    super.initState();
   Timer(Duration(seconds: 5),(){
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => ThirdPage()
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
            
            top: size.height*0,
          left: size.width*0.2,
            child: SvgPicture.asset("assets/icons/Component 2.svg",
            width: size.width * 0.8, ),
          ),
           Positioned (
          top: size.height*0.85 ,
            left: size.width*0,
          child: SvgPicture.asset("assets/icons/Component 1.svg", width: size.width * 0.3)  ,
          ),
         Positioned (
          top: size.height*0.4,
          left: size.width*0.35,
          child: SvgPicture.asset("assets/icons/mascot.svg", width: size.width * 0.4)  ,
          ),
          Positioned (
          top: size.height*0.62,
          left: size.width*0.30,
          child: SvgPicture.asset("assets/icons/namaskaar-text.svg", width: size.width * 0.4)  ,
          ),
        ],
       
        
      )
    ));
    
}
}

 