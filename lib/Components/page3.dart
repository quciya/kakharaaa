
import 'package:flutter/material.dart';
import'package:flutter_svg/flutter_svg.dart';
import 'page4.dart';
import 'package:polygon_clipper/polygon_border.dart';

class ThirdPage extends StatefulWidget {
   
  State<StatefulWidget> createState() {
    return SplashState();

  }

}
class SplashState extends State<ThirdPage> {
  @override

  Widget build(BuildContext context)
  {
    Size size= MediaQuery.of(context).size;
 return Scaffold(
      backgroundColor: Colors.white,
    body: Container(
      child:Stack(
        alignment:Alignment.center,
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
          top: size.height*0.52,
          left: size.width*0.2,
          child: SvgPicture.asset("assets/icons/hajurko-naam.svg", width: size.width * 0.6)  ,
          ),
          Positioned (
          top: size.height*0.76,
          left: size.width*-0.25,
          child: SvgPicture.asset("assets/icons/mascot.svg", width: size.width * 0.8)  ,
          ),
            
          
             Positioned(
                    top: size.height*0.75,
                    left:size.width*0.35,
                    height: size.height*0.2,
                    width:size.width*0.8,
                    child:RaisedButton(
                       shape: PolygonBorder(
                  sides: 8,
                  borderRadius: 45.0, // Default 0.0 degrees
                  rotate: 45.0, 
                  // Default 0.0 degrees
                  border: BorderSide.none, 
                       ),
                      color: Colors.green[100],
                       highlightColor: Colors.grey,
                      child:Icon(Icons.double_arrow_rounded,color:Color.fromRGBO(100, 200, 100,10),size:80),
                      onPressed: () {
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FourthPage()),
                        );
                      },
                         
                      
                          )
                    ),
         Positioned(            
                  top: size.height*0.6,
          left: size.width*0.2,
          right: size.width*0.2,
            child:TextField(  
                     decoration: InputDecoration(  
                      
                      enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                      color: Colors.grey, width: 3.0,),
                      borderRadius: (BorderRadius.all(Radius.circular(30))),
                      
                      
                  ),
                     
                  focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey, width: 3.0,),
                      borderRadius: (BorderRadius.all(Radius.circular(30))),
                      
                  ),
                    ),  
                  ),           
          )],
    )));
  }
  }
