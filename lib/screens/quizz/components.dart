
import 'package:flutter/material.dart';
import 'package:top_quizz_project/models/responses.dart';


// My Custom AppBar
AppBar MyAppBar(apptitle, {Widget? leading = null, Function()? onPressed = null}){
  return AppBar(
        centerTitle: true,
        title: Text(apptitle),
        backgroundColor: Colors.blue,
        toolbarHeight: 70,
        leading: leading
      );
}

// My Custom QuizzButton
class QuizzButton extends StatelessWidget {

  final String text;
  final double fontsize;
  void Function()? onPressed;

  QuizzButton({super.key, 
              required this.text,                 // the text of the item
              required this.fontsize,             // the default size
              required this.onPressed // the callback function
            });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      child: TextButton(
        onPressed: onPressed, 
        child: Text(text, style: TextStyle(fontSize: fontsize),)),
    );
  }  

}


Widget QuizzAnswerButton(text, onPressed) {
  return QuizzButton(text: text, fontsize: 20, onPressed: onPressed);
}

Widget QuizzQuestionButton(text) {
  return QuizzButton(text: text, fontsize: 25, onPressed: null);
}

// Customizing my AlertDialog
/*
AlertDialog MyCustomAlertDialog(BuildContext context, String title, String content, List<CustomDialogButton> buttons}) {
  
  return AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      ElevatedButton(
        onPressed: ,
        child: Text(buttons[0])
      ),

      ElevatedButton(
        onPressed: (){
           

          //Navigator.pop(context, DialogResponse.NO);
        }, 
        child: Text(buttons[1])
      )
    ],
  );
}

// Customizing my SimpleDialog
SimpleDialog MyCustomSimpleDialog(context, title) { 

  return SimpleDialog(
    title: Text(title),
    children: [
      SimpleDialogOption(
        child: Text('OUI'),
        onPressed: () {
          Navigator.pop(context, DialogResponse.YES);
        }
      ),

      SimpleDialogOption(
        child: Text('NON'),
        onPressed: () {
          Navigator.pop(context, DialogResponse.NO);
        }
      ),
    ],
  );
}

*/