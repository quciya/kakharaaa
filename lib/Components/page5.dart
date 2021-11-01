import 'package:flutter/material.dart';
import 'package:polygon_clipper/polygon_border.dart';
import'package:flutter_svg/flutter_svg.dart';
import'ImagetoLetterquiz.dart';
import 'LettertoImagequiz.dart';
import '../Lesson1.dart';
import 'pincode.dart';

class FifthPage extends StatefulWidget {
  
   State<StatefulWidget> createState() {
    return SplashState();

  }

}

class SplashState extends State<FifthPage> {
  Widget build(BuildContext context) {
   {
    Size size= MediaQuery.of(context).size;
    return  Container(
      color: Colors.white,
      child:Stack(
        alignment: Alignment.center,
          children: <Widget>[
         
 Positioned (
          top: size.height*0.48,
          left: size.width*0.62,
          child: SvgPicture.asset("assets/icons/dhaan.svg", width: size.width * 0.7,color: Color.fromRGBO(255,255,255, 200),colorBlendMode: BlendMode.modulate),
           ),
 Positioned (
          top: size.height*0.1,
          left: size.width*0,
          child: SvgPicture.asset("assets/icons/jun.svg", width: size.width * 0.6,color: Color.fromRGBO(255,255,255, 180),colorBlendMode: BlendMode.modulate)
           ),
           Positioned (
          top: size.height*0.83,
          left: size.width*-0.25,
          child: SvgPicture.asset("assets/icons/phool.svg", width: size.width * 0.7,color: Color.fromRGBO(255,255,255, 200),colorBlendMode: BlendMode.modulate),
           ),
            Positioned(
            width: size.width*0.4,
            height: size.height*0.4,
            top: size.height*0.1,
            left:size.width*0.5,
            child:RaisedButton(
              color: Colors.deepPurple,
              highlightColor: Colors.blueAccent,
            shape: PolygonBorder(
                  sides: 6,
                  borderRadius: 10.0, // Default 0.0 degrees
                  rotate: 0.0, // Default 0.0 degrees
                  border: BorderSide.none, 
                  
                  // Default BorderSide.none
                                 ),
                   onPressed:(){
                     Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Lesson1()),
                        );
                   },
                   child:SvgPicture.asset("assets/icons/kalam.svg"),
                   elevation: 30,
                            ),
          ),
Positioned(
            width: size.width*0.4,
            height: size.height*0.4,
            top: size.height*0.35,
            left:size.width*0.1,
            child:RaisedButton(
              color: Colors.red,
              highlightColor: Colors.black54,
            shape: PolygonBorder(
                  sides: 6,
                  borderRadius: 10.0, // Default 0.0 degrees
                  rotate: 0.0, // Default 0.0 degrees
                  border: BorderSide.none, 
                  // Default BorderSide.none
                                 ),
                   onPressed:(){
                     Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ILQuizPage(letterToProcess: "ख")),
                        );
                   },
                   child:SvgPicture.asset("assets/icons/putali.svg"),
                     elevation: 30,
),

 ) ,
 Positioned(
            width: size.width*0.4,
            height: size.height*0.4,
            top: size.height*0.6,
            left:size.width*0.5,
            child:RaisedButton(
              color: Colors.yellow[800],
              highlightColor: Colors.blueGrey,
            shape: PolygonBorder(
                  sides: 6,
                  borderRadius: 10.0, // Default 0.0 degrees
                  rotate: 0.0, // Default 0.0 degrees
                  border: BorderSide.none, 
                  // Default BorderSide.none
                                 ),
                   onPressed:(){
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LIQuizPage(letterToProcess: "त"),),
                        );
                   },
                   child:SvgPicture.asset("assets/icons/chara.svg"),
                     elevation: 30,
),
 
 ),
 Positioned(
                    top: size.height*0.02,
                    left:size.width*-0.1,
                    height: size.height*0.12,
                    width:size.width*0.4,
                    child:RaisedButton(
                       shape: PolygonBorder(
                  sides: 4,
                  borderRadius: 30.0, // Default 0.0 degrees
                  rotate: 45.0, 
                  // Default 0.0 degrees
                  border: BorderSide.none, 
                       ),
                      color: Colors.grey[300],
                       highlightColor: Colors.grey[600],
                      child:Icon(Icons.settings_outlined,color:Colors.black54,size:50),
                      onPressed: () {
                         Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PinCode()),
                    );
                      },
                         
                      
                          )
                    ),
         

         
 ],
       
        
      )
    );
  
     }
     }
}