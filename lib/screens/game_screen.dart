import 'package:flutter/material.dart';
import 'package:rock_paper_scisor/screens/main_sccreen.dart';
import 'package:rock_paper_scisor/utils/game.dart';
import 'package:rock_paper_scisor/widgets/game_buttons.dart';

class GameScreen extends StatefulWidget {
  GameScreen(this.gameChoice,{Key? key}) : super(key: key);
  Choices gameChoice;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {

    String? robotChoice = Game.randomChoice();
    String robotChoicePath = "";
    switch (robotChoice){
      case "Rock":
        robotChoicePath = "assets/rock_btn.png";
        break;
      case "Paper":
        robotChoicePath = "assets/paper_btn.png";
        break;
      case "Scisor":
        robotChoicePath = "assets/scisor_btn.png";
        break;
      default:
    }
    String? player_choice;
    switch (widget.gameChoice.type){
      case "Rock":
        player_choice = "assets/rock_btn.png";
        break;
      case "Paper":
        player_choice = "assets/paper_btn.png";
        break;
      case "Scisor":
        player_choice = "assets/scisor_btn.png";
        break;
      default:
    }

    if(Choices.gameRule[widget.gameChoice.type]![robotChoice] == "You Win"){
      setState(() {
        Game.score++;
      });
    }


    return Scaffold(
      backgroundColor: Colors.deepPurple,
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
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: "${widget.gameChoice.type}",
                        child: gameButton(null,player_choice!, 140)
                    ),
                    Text("vs",style: TextStyle(color: Colors.white,fontSize: 30),),
                    gameButton(null, robotChoicePath, 140),
                  ],
                ),
              ),
            ),
            Text("${Choices.gameRule[widget.gameChoice.type]![robotChoice]}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                padding: EdgeInsets.all(16),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>mainScreen()));
                },
                shape: StadiumBorder(
                    side: BorderSide(color: Colors.white, width: 5)),
                child: Text(
                  "Play Again",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          /*  Container(
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
