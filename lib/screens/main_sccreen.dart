import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rock_paper_scisor/screens/game_screen.dart';
import 'package:rock_paper_scisor/utils/game.dart';
import 'package:rock_paper_scisor/widgets/game_buttons.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff060a47),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 34, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all((16)),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SCORE",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32),
                  ),
                  Text(
                    "${Game.score}",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              child: Center(
                child: Stack(
                  children: [
                    Positioned(
                        top: 50,
                        right: 60,
                        child: Hero(
                          tag: "Rock",
                          child: gameButton(() {
                            print("You choose Rock");
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => GameScreen(Choices("Rock")),));
                          }, "assets/rock_btn.png", 200),
                        )),
                    Positioned(
                        bottom: 10,
                        left: 140,
                        child: Hero(
                          tag: "Scisor",
                          child: gameButton(() {
                            print("You choose Scisor");
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => GameScreen(Choices("Scisor")),));
                          }, "assets/scisor_btn.png", 200),
                        )),
                    Positioned(
                        bottom: 10,
                        right: 140,
                        child: Hero(
                          tag: "Paper",
                          child: gameButton(() {
                            print("You choose Paper");
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => GameScreen(Choices("Paper")),));
                          }, "assets/paper_btn.png", 200),
                        )),
                  ],
                ),
              ),
            ),
            /*Container(
              width: double.infinity,
              child: RawMaterialButton(
                padding: EdgeInsets.all(16),
                onPressed: () {},
                shape: StadiumBorder(
                    side: BorderSide(color: Colors.white, width: 5)),
                child: Text(
                  "RULES",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
