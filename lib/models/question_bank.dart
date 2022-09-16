

import 'package:top_quizz_project/models/question.dart';
import 'qb_categories/Html_Css.dart';
import 'qb_categories/JavaScript.dart';
import 'qb_categories/Cpp.dart';
import 'qb_categories/C.dart';
import 'qb_categories/Animees.dart';

class QuestionBank {

  final String category;
  QuestionBank({this.category = 'html_css'});

  List<Question>? getQuestions() {
    
    // list availiable categories
    Map<String, List<Question>> availiable_categories = {
      'html_css': Qb_HTML_CSS().get(),
      'cpp': Qb_CPP().get(),
      'c': Qb_C().get(),
      'animees': Qb_Animmees().get(),
      'javascript': Qb_JavaScript().get()
    };

    if (availiable_categories.containsKey(this.category)) {
      return availiable_categories[this.category];
    } else return [];
  }
}