import 'package:flutter/material.dart';
import 'package:top_quizz_project/models/user.dart';
import 'package:top_quizz_project/screens/Screen.dart';
import 'package:top_quizz_project/screens/quizz/score_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Top Quizz',
      
      home: Screen(),
      //home: const HomePage(title: 'Top Quizz'),
      //home: const QuizzPage(apptitle: 'Top Quizz', username: 'dano')
      //home:  ScorePage(user: User('danofred', 5), onChangePage: (index, user){ print("Index : $index - $user");})
    );
  }
}
