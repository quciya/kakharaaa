import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pinbox.dart';
import 'page5.dart';
// ignore: unused_import
import './lists.dart';

void main() => runApp(new PinCode());

class PinCode extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      home: new PinCodePage(),
    );
  }
}

class PinCodePage extends StatefulWidget {

  @override
  PinCodeState createState() => new PinCodeState();
}

class PinCodeState extends State<PinCodePage> {

  List<TextEditingController> controllers = <TextEditingController>[new TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController()];

  @override
  Widget build(BuildContext context) {
     
    
    Size size= MediaQuery.of(context).size;
   List words= numbers.keys.toList();
   words.shuffle();
    return new Scaffold(
      
      appBar: new AppBar(
  leading: BackButton(
     color: Colors.blue[300],
     onPressed:() {Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FifthPage()),
                        );
     }),
        backgroundColor: Colors.white,
        title: new Text("Hi! Parents.",
        style: GoogleFonts.poppins(fontSize: 20.0, color: Colors.blue[300],fontWeight:FontWeight.w700),
                     ),
                     ),
      
      body: new Container(
        
        height: size.height,
        width:size.width,
       
        child:Stack(
        children: <Widget>[
          Positioned(
          top:size.height*0.1,
          left:size.width*0.03,
        child: Text("Please enter the following numbers:",
        style: GoogleFonts.poppins(fontSize: 20.0, color: Colors.grey,fontWeight:FontWeight.w700),
                     )),
           Positioned(
           top:size.height*0.3,
           left:size.width*0.2,
            child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: pinBoxs(50.0, controllers, Colors.blue[300], Colors.white, context, false),
          
        )),
         Positioned(
          top:size.height*0.2,
          left:size.width*0.1,
        child: Text(words[0],
        style: GoogleFonts.poppins(fontSize: 20.0, color: Colors.grey,fontWeight:FontWeight.w500),
                     )),
         Positioned(
          top:size.height*0.2,
          left:size.width*0.3,
        child: Text(words[1],
        style: GoogleFonts.poppins(fontSize: 20.0, color: Colors.grey,fontWeight:FontWeight.w500),
                     )),
                      Positioned(
          top:size.height*0.2,
          left:size.width*0.5,
        child: Text(words[2],
        style: GoogleFonts.poppins(fontSize: 20.0, color: Colors.grey,fontWeight:FontWeight.w500),
                     )),
                      Positioned(
          top:size.height*0.2,
          left:size.width*0.7,
        child: Text(words[3],
        style: GoogleFonts.poppins(fontSize: 20.0, color: Colors.grey,fontWeight:FontWeight.w500),
                     )),
        
        ]),
    ));
  }
}