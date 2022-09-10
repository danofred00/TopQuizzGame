import 'package:flutter/material.dart';
import 'package:top_quizz_project/models/user.dart';
import 'home_component.dart';

class HomePage extends StatefulWidget {
  final String title;
  final Function(int index, User user) onChangePage;
  const HomePage({super.key, required this.title, required this.onChangePage});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyHomeBody(widget.title, context, widget.onChangePage)
    );
  }
}
