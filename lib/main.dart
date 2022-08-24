import 'package:flutter/material.dart';
import 'package:rock_paper_scisor/screens/main_sccreen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "R.P.S.",
      home: mainScreen(),
    );
  }
}
