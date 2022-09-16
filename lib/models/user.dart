
/**
 * This class represent my User Object
 */
class User {

  String name;
  int score;
  int question_count = 0;

  User(this.name, this.score, {int question_count = 0}) {
    this.question_count = question_count;
  }

  @override
  String toString() {
    return "<User ${name} - ${score} - ${question_count}>";
  }
}
