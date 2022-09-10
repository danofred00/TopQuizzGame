
import 'package:flutter/material.dart';
import 'package:top_quizz_project/functions.dart';
import 'package:top_quizz_project/models/Rank.dart';
import 'package:top_quizz_project/models/question_bank.dart';
import 'package:top_quizz_project/models/user.dart';
import 'package:top_quizz_project/screens/quizz/components.dart';


class ScorePage extends StatefulWidget {

  final User user;
  final Function(int index, User user) onChangePage;
  const ScorePage({super.key, required this.user, required this.onChangePage});

  @override
  State<ScorePage> createState() => _ScorePageState();
}


class _ScorePageState extends State<ScorePage> {

  // getting user about
  User user = User('', 0);
  String rank_toString = '';

  _ScorePageState(); 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    user = widget.user;
    rank_toString = Rank(user.score, QuestionBank().getQuestions().length).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: MyAppBar('Top Quizz'),

      body: Column(
        children: [
          // main text
          Expanded(
            child: Center(
              child: Container(
          
                margin: EdgeInsets.all(50.0),
                child: Column(
          
                  children: <Widget>[
          
                    // rank title
                    Text('score'.toUpperCase(), style: TextStyle(fontSize: 35),),
          
                    SizedBox(height: 10,),
          
                    // rank details container
                    Container(
          
                      //mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      
                      child: RichText(text: TextSpan(
                        children: [
                          TextSpan(text: 'Username: ${user.name} \n'),
                          TextSpan(text: 'Score : ${user.score} \n'),
                          TextSpan(text: 'Rank : $rank_toString \n')
                        ],
                        style: TextStyle(fontSize: 30)
                      ))
                    ),
          
                    // separator
                    SizedBox(height: 30.0,),
          
                    // buttonBar container
          
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      buttonPadding: EdgeInsets.all(5.0),
                      children: [
          
                        // retry Button
                        ElevatedButton.icon(
                          onPressed: (){
                            
                            // using onChangePage here to navigate here
                            widget.onChangePage(1, User(user.name, 0));
          
                            // when the user click on retry button
                            //if(Navigator.of(context).canPop())
                            //{
                            //  // a simple debug print message
                            //  debugPrint('Debug :: Going at the last screen');
                            //  // go at the previous screen
                            //  Navigator.of(context).pop();
                            //}
                              
                          }, 
                          icon: Icon(Icons.restore), 
                          label: Text('Retry'),
                        ),
          
                        ElevatedButton.icon(
                          onPressed: (){ widget.onChangePage(0, User(user.name, 0));}, 
                          icon: Icon(Icons.home_outlined), 
                          label: Text('Go Home')
                        )
          
                      ],
                    ),
                  ],
                ),
              )
            ),
          ),

          // my name here
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(15),
          alignment: Alignment.center,
          color: Colors.black.withOpacity(0.7),
          child: Text('Created By @Danofred0', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
        )
        ],
      ),

    );
  }
}