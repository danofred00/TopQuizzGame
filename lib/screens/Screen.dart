
import 'package:flutter/material.dart';

import 'package:top_quizz_project/models/user.dart';
import 'package:top_quizz_project/screens/home/home_screen.dart';
import 'package:top_quizz_project/screens/quizz/quizz_screen.dart';
import 'package:top_quizz_project/screens/quizz/score_screen.dart';



class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}


class _ScreenState extends State<Screen> {

  
  User _user = User('', 0);
  int _currentSelected = 0;
  List<Widget> _widgets = [];
  
  void onChangePage(int index, User user) {
    
    print(user.toString());

    setState((){ 
      _user = user;
      _currentSelected = index;
    
      // redefining _widgets list
      _widgets = [
        HomePage(title: 'Top Quizz', onChangePage: onChangePage),
        QuizzPage(apptitle: 'Top Quizz', user: _user, onChangePage: onChangePage),
        ScorePage(user: _user, onChangePage: onChangePage),
      ];
    
    });

  }

  // init state fuynction
  @override
  void initState() {
    super.initState();

    _widgets.addAll([
      HomePage(title: 'Top Quizz', onChangePage: onChangePage),
      QuizzPage(apptitle: 'Top Quizz', user: _user, onChangePage: onChangePage),
      ScorePage(user: _user, onChangePage: onChangePage),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return _widgets.elementAt(_currentSelected);
  }
}