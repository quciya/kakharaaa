import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import  'lists.dart';
import 'congrats.dart';

class LIQuizPage extends StatefulWidget {
  final String letterToProcess;
  LIQuizPage({Key key, this.letterToProcess}) : super(key: key);
  @override
  LIQuizState createState() => LIQuizState();
}


class LIQuizState extends State<LIQuizPage> {
  @override
  Widget build(BuildContext context) {
List images =imageletter.values.toList();
images.shuffle();
List toShuffle = [images[0], images[1],images[2],images[3]];
if (!(toShuffle.contains(imageletter[widget.letterToProcess]))) {
toShuffle[0]=imageletter[widget.letterToProcess];
}
toShuffle.shuffle();
Size size= MediaQuery.of(context).size;
  return Container(
    color: Colors.white,
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(size.height*0.05)),
                MaterialButton(
                  
                child:new Text(
                     widget.letterToProcess,
                        style: GoogleFonts.poppins(fontSize: 100.0, color: Colors.red[600],fontWeight:FontWeight.w600)),
                onPressed:() {

                },
                ),
                new Padding(padding: EdgeInsets.all(size.height*0.05)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //button 1
                    new MaterialButton(
                      elevation: 5,
                      height: size.height*0.18,
                      minWidth: size.width*0.4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)),),
                      color: Colors.grey[400],
                      highlightColor: Colors.yellow[200],

                      onPressed: () {
                      if(toShuffle[0]==imageletter[widget.letterToProcess])
                      {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Congrats()));
                      }
                      }
                      ,
                      child: new SvgPicture.asset("assets/icons/${toShuffle[0]}.svg",width:size.width*0.25,)
                    ),

                    //button 2
                     MaterialButton(
                       minWidth: size.width*0.4,
                       height: size.height*0.18,
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                      color: Colors.grey[400],
                      highlightColor: Colors.yellow[200],
                        elevation: 5,
                      onPressed: () {
                        if(toShuffle[1]==imageletter[widget.letterToProcess])
                         {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Congrats()));
                         }



                      },
                      child:  new SvgPicture.asset("assets/icons/${toShuffle[1]}.svg",width:size.width*0.25,)
                      ),
                    
                  ],
                ),

                new Padding(padding: EdgeInsets.all(30.0)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //button 3
                  new MaterialButton(
                      minWidth: size.width*0.4,
                      height: size.height*0.18,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                      color: Colors.grey[400],
                      highlightColor: Colors.yellow[200],
                      
                      elevation: 5,
                      
                      onPressed: () {
                      if(toShuffle[2]==imageletter[widget.letterToProcess])
                                    {
                          
                                       Navigator.push(context, MaterialPageRoute(builder: (context) => Congrats()));
                                    }

                      },
                      child: new SvgPicture.asset("assets/icons/${toShuffle[2]}.svg",width:size.width*0.25,)
                    ),
                    
                    //button 4
                    new MaterialButton(
                      
                      minWidth: size.width*0.4,
                      height: size.height*0.18,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                      color: Colors.grey[400],
                    highlightColor: Colors.yellow[200],
                      elevation: 5,
                      onPressed: () {
                        if(toShuffle[3]==imageletter[widget.letterToProcess])
                        {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => Congrats()));
                        }
                      },
                      child:  new SvgPicture.asset("assets/icons/${toShuffle[3]}.svg",width:size.width*0.25,)
                    ),
                    
                  ]
                ),
              ]
            ),
          );
  }

}