
class User {

  String name;
  int score;

  User(this.name, this.score);

  @override
  String toString() {
    return "<User ${name} - ${score}>";
  }
}
