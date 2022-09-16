
/**
 * This class represent my User Object
 */
class User {

  String name;
  int score;
  int question_count = 0;
  String category = '';

  User(this.name, this.score, {int question_count = 0, String category = 'html_css'}) {
    this.question_count = question_count;
    this.category = category;
  }

  // getters
  String getCategory() { return this.category;}

  // setters
  void setCategory(String category){ this.category = category;}

  @override
  String toString() {
    return "<User ${name} - ${score} - ${question_count}>";
  }
}
