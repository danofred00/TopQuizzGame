
import 'package:flutter/material.dart';
import 'package:top_quizz_project/functions.dart';
import 'package:top_quizz_project/models/question_bank.dart';
import 'package:top_quizz_project/models/user.dart';
import 'package:top_quizz_project/screens/quizz/quizz_screen.dart';

class MyHomeBody extends StatelessWidget {
  final String apptitle;
  final context;
  final Function(int index, User user) onChangePage;
  String username = '';
  final _formKey = GlobalKey<FormState>();

  MyHomeBody(this.apptitle, this.context, this.onChangePage, {super.key});

  // question count
  int question_count = 0;
  int min_question_count = 5;
  int max_question_count = QuestionBank().getQuestions()!.length;

  // local variables
  String appDescription = "Une superbe application de quizz juste pour vous.";
  String tmp_txt = "Entrez votre nom pour continuer.";
  String btn_next_text = "Continuer";

  // form vars
  String form_hint_label_text = "Ex: John";
  String form_label_text = 'Nom';
  String form_error_empty = 'Champ de saisie vide';
  String form_error_ins = 'Trois (03) Caracteres minimum';

  String form_hint_qlabel_text = "min=5 | max=99";
  String form_label_qtext = 'Nombre de question';
  String form_error_qempty = 'Champ de saisie vide';
  String form_error_qins = '5 au minimum';

  // Validate Form function
  void validateForm() {
    if (_formKey.currentState!.validate()) {
      //_formKey.currentState!.save();
      changeToQuizzScreen();
    }
  }

  // Go at the next Screen
  void changeToQuizzScreen() {
    onChangePage(1, User(username, 0, question_count: question_count));
    //startActivity(context, QuizzPage(apptitle: apptitle, user: User('$username', 0)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // app title area
                Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: 70.0,
                    alignment: Alignment.center,
                    child: Text(
                      apptitle.toUpperCase(),
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    )),

                // body page area

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Text(
                        appDescription,
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        tmp_txt,
                        style: TextStyle(fontSize: 15),
                      ),

                      SizedBox(
                        height: 50,
                      ),

                      // the current form
                      Form(
                          key: _formKey,
                          child: Container(
                            margin: EdgeInsets.only(left: 50, right: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[

                                // username input 
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: form_label_text,
                                    hintText: form_hint_label_text,
                                    icon: Icon(Icons.person),
                                  ),
                                  keyboardType: TextInputType.name,
                                  // When the text change
                                  onChanged: (value) => username = value,
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return form_error_empty;
                                    else if (question_count < 3)
                                      return form_error_ins;

                                    return null;
                                  },
                                  //onSaved: (value) => username = value,
                                ),

                                // question count input
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: form_label_qtext,
                                    hintText: form_hint_qlabel_text,
                                    icon: Icon(Icons.numbers)
                                  ),
                                  keyboardType: TextInputType.number,
                                  // When the text change
                                  onChanged: (value) => question_count = int.parse(value),
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return form_error_qempty;
                                    else if (question_count < 5)
                                      return form_error_qins;

                                    return null;
                                  },
                                  //onSaved: (value) => username = value,
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  onPressed: validateForm,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      btn_next_text.toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
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
    );
  }
}
