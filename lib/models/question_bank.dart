
import 'package:top_quizz_project/models/question.dart';

class QuestionBank {

  List<Question> getQuestions() {
    
    return [
      Question('Quelle propriete CSS pouvons nous utiliser pour changer la couleur d\'un texte ?', 
      'color', 
      'font-color', 
      'text-color', 
      'background-color', 
      1),

      Question('Quelle propriete CSS pouvons nous utiliser pour modifier l\'alignement d\'un texte ?', 
      'align', 
      'font-align', 
      'text-align', 
      'Aucun choix correct', 
      3),

      Question('Quelle est la bonne syntaxe pour souligner un paragraphe ?', 
      'p .one { text-decoration: underline }', 
      'p { text-decoration: underline }', 
      'p .one { text-decoration: overline }', 
      'p { text-decoration: overline }', 
      2),

      Question('Quelle est la bonne syntaxe pour mettre en gras un paragraphe ?', 
      'p { font-weight: bold }', 
      'p .one { font-weight: bold }', 
      'p { text-weight: bold }', 
      'p .one { text-weight: bold }', 
      1),

      Question('Quelle propriete CSS pouvons nous utiliser pour changer la taille d\'un texte ?', 
      'text-size', 
      'font-size', 
      'size', 
      'Aucun choix correct', 
      2),

      Question('La propriete padding sert a modifier ... d\'un element.', 
      'les marges exterieures', 
      'les bordures', 
      'la taille', 
      'les marges interieures', 
      4),

      Question('La propriete margin sert a modifier ... d\'un element.', 
      'les marges exterieures', 
      'les bordures', 
      'la taille', 
      'les marges interieures', 
      1),

      Question("Comment changer l'arriere plan d'un element html ?", 
      'element { background-image: lien_image; }', 
      'element { background-image: uri("lien_image"); }', 
      'element { background-image: url("lien_image"); }', 
      'element { background-image: http(lien_image); }', 
      3),

      Question('Quelle propriete CSS pouvons nous utiliser pour changer la largeur d\'un element html ?', 
      'width', 
      'height', 
      'border', 
      'Aucun choix correct', 
      1),

      Question('Choisir la syntaxe correcte', 
      '<style src="style.css"></style>', 
      '<style href="style.css"></style>', 
      '<link rel="stylesheet" href="style.css" />', 
      '<style src="style.css" />', 
      3),
      
    ];
  }
}