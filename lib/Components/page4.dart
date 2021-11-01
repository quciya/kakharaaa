import 'package:audioplayers/audio_cache.dart';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:polygon_clipper/polygon_border.dart';
import 'page5.dart';

int i = 0;
List<String> images = [
  "assets/icons/tharu-male.svg",
  "assets/icons/tharu-female.svg",
  "assets/icons/Newar boy.svg",
  "assets/icons/Newar girl.svg",
  "assets/icons/Chettri boy.svg",
  "assets/icons/Chettri girl.svg",
  "assets/icons/Sherpa boy.svg",
  "assets/icons/Sherpa girl.svg",
];
final avataarPlayer = AudioCache(prefix: 'assets/guides/');
final player = AudioCache(prefix: 'assets/sfx/');

class FourthPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: new MyHomePage(0, ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(int i, this.title);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void playSound() {

    player.play('swoosh.mp3'); //The volume is very low
  }

  @override
  void initState() {
    
    avataarPlayer.play('avataar_chayan.mp3');
    super.initState();
  }
 @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        color: Color.fromRGBO(139, 148, 143, 1),
                        shape: PolygonBorder(
                          sides: 3,
                          borderRadius: 60,
                          rotate: 90.0,
                          border: BorderSide.none,
                        ),
                        onPressed: () {
                          setState(() {
                            if (i > 0) {
                              i = i - 1;
                            }
                          });
                          playSound();
                        },
                        splashColor: Color.fromRGBO(39, 174, 96, 1),
                      ),
                      AvatarDisplay(parentSize: size),
                      RaisedButton(
                        color: Color.fromRGBO(139, 148, 143, 1),
                        shape: PolygonBorder(
                          sides: 3,
                          borderRadius: 60.0,
                          rotate: 270.0,
                          border: BorderSide.none,
                        ),
                        onPressed: () {
                          setState(() {
                            if (i < 7) {
                              i = i + 1;
                            }
                          });
                          playSound();
                        },
                        splashColor: Color.fromRGBO(39, 174, 96, 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
                top: size.height * 0.7,
                left: size.width * 0.1,
                height: size.height * 0.2,
                width: size.width * 0.8,
                child: RaisedButton(
                  shape: PolygonBorder(
                    sides: 8,
                    borderRadius: 45.0, // Default 0.0 degrees
                    rotate: 45.0,
                    // Default 0.0 degrees
                    border: BorderSide.none,
                  ),
                  color: Colors.deepOrange[300],
                  highlightColor: Colors.indigo,
                  child: Icon(Icons.arrow_right_rounded,
                      color: Colors.white, size: 120),
                  onPressed: () {
                    playSound();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FifthPage()),
                    );
                  },
                  elevation: 5,
                )),
            Positioned(
              top: size.height * 0.9,
              left: size.width * 0.3,
              child: SvgPicture.asset("assets/icons/mascot-grey.svg",
                  width: size.width * 0.4),
            ),
          ],
        ),
      ),
    );
  }
}

class AvatarDisplay extends StatefulWidget {
  final Size parentSize;
  AvatarDisplay({Key key, this.parentSize}) : super(key: key);

  @override
  _AvatarDisplayState createState() => _AvatarDisplayState();
}

class _AvatarDisplayState extends State<AvatarDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircularProfileAvatar(
        null,
        child: SvgPicture.asset(images[i]),
        elevation: 0,
        radius: widget.parentSize.width * 0.25,
        backgroundColor: Colors.white,
      ),
    );
  }
}
