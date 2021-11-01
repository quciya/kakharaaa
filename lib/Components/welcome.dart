import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'page2.dart';   
import'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override


  State<StatefulWidget> createState() {
    return SplashState();
      
    
}
}
class SplashState extends State<SplashScreen> {
  @override

  void initState() {
    super.initState();
     MaterialApp(
     theme:ThemeData(
     backgroundColor:Colors.white,
   ));
   Timer(Duration(seconds: 3),(){
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> SecondPage()
     ));
   });
  
  }
  
 
  Widget build(BuildContext context) {
     
    
    Size size= MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
    body: Container(
      
      height: size.height,
      width: size.width,
      child:Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: size.height*0.015 ,
            left: size.width*0.05,
            child: SvgPicture.asset("assets/icons/jun.svg",width: size.width * 0.6,color: Color.fromRGBO(255,255,255, 200),colorBlendMode: BlendMode.modulate), ),
          
           Positioned (
          top: size.height*0.7,
          left: size.width*0.7,
          child: SvgPicture.asset("assets/icons/mauri.svg", width: size.width * 0.3,color: Color.fromRGBO(255,255,255, 200),colorBlendMode: BlendMode.modulate))  ,
          
         Positioned (
          top: size.height*0.3,
          left: size.width*0,
          child: SvgPicture.asset("assets/icons/mascot-pointing.svg", width: size.width * 0.6)  ,
          ),
          Positioned (
          top: size.height*0.55,
          left: size.width*0.3,
          child: SvgPicture.asset("assets/icons/logo-text.svg", width: size.width * 0.65)  ,
          ),
  
        ],
       
        
      )
    ));
  
     }
     }
