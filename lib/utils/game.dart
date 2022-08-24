import 'dart:math';

class Game{
  static int score = 0;

  static List<String> choices = ["Rock","Paper","Scisor"];
  static String? randomChoice(){
    Random random = new Random();
    int robotChoiceIndex = random.nextInt(3);
    return choices[robotChoiceIndex];

  }
}

class Choices{
  String? type = "";

  static var gameRule = {
    "Rock":{
      "Rock":"It's a Draw",
      "Paper":"You Lose",
      "Scisor":"You Win",
    },
    "Paper":{
      "Paper":"It's a Draw",
      "Scisor":"You Lose",
      "Rock":"You Win",
    }
    ,"Scisor":{
      "Scisor":"It's a Draw",
      "Paper":"You Win",
      "Rock":"You Lose",
    }
  };
  Choices(this.type);
}