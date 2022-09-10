import 'package:flutter/material.dart';
import 'package:top_quizz_project/models/question.dart';
import 'package:top_quizz_project/models/question_bank.dart';
import 'package:top_quizz_project/models/responses.dart';
import 'package:top_quizz_project/models/user.dart';
import 'package:top_quizz_project/screens/quizz/components.dart';

class QuizzPage extends StatefulWidget {
  final String apptitle;
  final User user;
  final Function(int index, User user) onChangePage;
  const QuizzPage({super.key, 
                  required this.apptitle, 
                  required this.user,
                  required this.onChangePage
              });

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {

  List<Question> questionBank = <Question>[];
  String apptitle = '';
  User user = User('', 0);
  int score = 0;
  int current = 0;

  // key for scaffold container
  //final GlobalKey<ScaffoldState> sKey = new GlobalKey<ScaffoldState>();
  _QuizzPageState();

  @override
  void initState() {
    super.initState();

    apptitle = widget.apptitle;
    user = widget.user;

    // shuffle the list
    questionBank = QuestionBank().getQuestions();
    questionBank.shuffle();

    print(user);
  }

  // this function is called when the user clic on button
  void onPressed(int val) {
    if (val == questionBank[current].answer_index) {
      // show modal sheet bottom
      _showModalBottomSheet('Bonne Reponse');
      // increment the user's score
      setState(() {
        user.score = ++score;
      });
    } else {
      // if the user's answer is not correct
      _showModalBottomSheet('Mauvaise Reponse');
    }

    // going at the next question
    if (current < questionBank.length - 1) {
      setState(() {
        current++;
      });
    } else if (current+1 == questionBank.length) {
      
      // if the current question is the lasted
      // we print the message
      print('QuizzActivity -> User is at the Last Question');
      widget.onChangePage(2, user);
    }
  }

  // my custom showModalBottomSheet
  Future _showModalBottomSheet(message) async{
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message),
            ],
          ),
        );
      },
    );
  }

  void onPressedButton1() {
    onPressed(1);
  }

  void onPressedButton2() {
    onPressed(2);
  }

  void onPressedButton3() {
    onPressed(3);
  }

  void onPressedButton4() {
    onPressed(4);
  }

  // on pressed backButton
  Future onPressedBackButton() async{

    debugPrint("QuizzActivity -> New User's Request :: Trying to go at the last activity");
    
    switch (await showDialog<DialogResponse>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Voulez vous vraiment quitter ?'),
        content: Text("Toute votre partie risque d'etre reinitialiser"),
        actions: [
          ElevatedButton(
            onPressed: (){Navigator.pop(context, DialogResponse.YES);},
            child: Text('OUI')
          ),

          ElevatedButton(
            onPressed: (){Navigator.pop(context, DialogResponse.NO);}, 
            child: Text('NON')
          )
        ],
      )
    )) {

      // switch body
      ///////////////////////////////////
      case DialogResponse.YES:
        // going at the last screen
        //if(Navigator.of(context).canPop()){
        //
        //  debugPrint('QuizzActivity -> User returned at the home screen');
        //  Navigator.of(context).pop();
        //}

        widget.onChangePage(0, user);
        break;
      
      case DialogResponse.NO:
        
        debugPrint('QuizzActivity -> Request Canceled');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        apptitle,
        leading: BackButton(onPressed: onPressedBackButton, color: Colors.white),
      ),
      
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            // score widget
            Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.topRight,
              child: Text('Score : ${user.score}', style: TextStyle(fontSize: 15)),
            ),

            // question container
            Expanded(
              child: Card(
                elevation: 2.0,
                color: Colors.grey[100],
                child: QuizzQuestionButton(questionBank[current].question),
              ),
            ),

            // Answer container
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 30.0),
              child: Column(
                children: [
                  Card(
                      child: QuizzAnswerButton(
                          questionBank[current].answer1, onPressedButton1)),
                  Card(
                      child: QuizzAnswerButton(
                          questionBank[current].answer2, onPressedButton2)),
                  Card(
                      child: QuizzAnswerButton(
                          questionBank[current].answer3, onPressedButton3)),
                  Card(
                      child: QuizzAnswerButton(
                          questionBank[current].answer4, onPressedButton4))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
