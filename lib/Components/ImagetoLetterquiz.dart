import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import  'lists.dart';
import 'congrats.dart';

class ILQuizPage extends StatefulWidget {
  final String letterToProcess;
  ILQuizPage({Key key, this.letterToProcess}) : super(key: key);
  @override
  ILQuizState createState() => ILQuizState();
}


class ILQuizState extends State<ILQuizPage> {
  @override
  Widget build(BuildContext context) {
List letters =imageletter.keys.toList();
letters.shuffle();
List toShuffle = [letters[0], letters[1],letters[2],letters[3]];
if (!(toShuffle.contains(widget.letterToProcess))) {
toShuffle[0]=widget.letterToProcess;
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
                child: new SvgPicture.asset("assets/icons/${imageletter[widget.letterToProcess]}.svg",width:size.width*0.5,),
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
                      if(toShuffle[0]==widget.letterToProcess)
                      {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Congrats()));
                      }
                      }
                      ,
                      child: new Text(
                      toShuffle[0],
                       style: GoogleFonts.poppins(fontSize: 70.0, color: Colors.yellow[700],fontWeight:FontWeight.w600),
                      ),
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
                        if(toShuffle[1]==widget.letterToProcess)
                         {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Congrats()));
                         }



                      },
                      child: new Text(
                     toShuffle[1],
                        style: GoogleFonts.poppins(fontSize: 70.0, color: Colors.green[600],fontWeight:FontWeight.w600)),
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
                      if(toShuffle[2]==widget.letterToProcess)
                                    {
                          
                                       Navigator.push(context, MaterialPageRoute(builder: (context) => Congrats()));
                                    }

                      },
                      child: new Text(
                       
                        toShuffle[2],

                        style: GoogleFonts.poppins(fontSize: 70.0, color: Colors.purple[500],fontWeight:FontWeight.w600),
                      ),
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
                        if(toShuffle[3]==widget.letterToProcess)
                        {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => Congrats()));
                        }
                      },
                      child: new Text(
                        toShuffle[3],
                        style: GoogleFonts.poppins(fontSize: 70.0, color: Colors.red[800],fontWeight:FontWeight.w600),
                        textScaleFactor: 1,
                      ),
                    ),
                    
                  ]
                ),
              ]
            ),
          );
  }

}