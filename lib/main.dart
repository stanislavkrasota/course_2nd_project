import 'package:course_2nd_project/quiz.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepOrange, Colors.amber],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: const Quiz(),
        ),
      ),
    ),
  );
}
